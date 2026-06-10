/*
 *  Copyright 2005-2014 Acer Cloud Technology, Inc.
 *  All Rights Reserved.
 *
 *  This software contains confidential information and
 *  trade secrets of Acer Cloud Technology, Inc.
 *  Use, disclosure or reproduction is prohibited without
 *  the prior express written permission of Acer Cloud
 *  Technology, Inc.
 */

/*
  title_manager.js for (v)Wii
*/
/**
 * @type {Function}
 */
var TitleManager;
if ( !TitleManager ) TitleManager = {};
else if ( typeof TitleManager != "object" )
    throw new Error("TitleManager already exists and is not an object");

/**
  * @type {Function}
  * @constructor
  * @param {string} titleId TitleId
  * @param {number} titleSize The number of real size of the title (private contents and tmd and e-ticket)
  * @param {string} tmdSizeOnServer The size of tmd of the title
  * @param {number} titleVersion The version of the title
*/
TitleManager = function( titleId, titleSize, tmdSizeOnServer, titleVersion )
{
    titleId = titleId.replace("00010002", "00010001");
    /*
        private properties
    */
    //default FS_BLOCK_SIZE is 16384 (16 * 1024)
    var FS_BLOCK_SIZE           = 0;
    //default WII_BLOCK_SIZE is FS_BLOCK_SIZE * 8
    var WII_BLOCK_SIZE = 128 * 1024;
    var tempUsedByShop = 0;
    var tempBlockSize = 2560 - tempUsedByShop;

    var _deviceInfo = null;
    var _titleInfo  = null;

    // These values are device information
    var _userBlocks             =  new Blocks( 0 , 0 );
    var _allBlocks              =  new Blocks( 0 , 0 );

    function Blocks( total, used )
    {
        this.total =  total;
        this.used  =  used;
        this.avail =  this.total - this.used;
    }

    // These values are title information on the device
    var _currentTitleBlocks     = 0;
    var _currentTitleVersion    = 0;
    var _isOnDevice             = false;
    var _isTmdPresent           = false;

    // These values are title information on the server
    var _newTitleBlocks         = 0;
    var _newTitleMetaBlocks     = 0;

    /*
        private methods
    */
    function _size2FsBlocks( size )
    {
        return Math.ceil( size / FS_BLOCK_SIZE );
    }

    function _fs2WiiBlocks( fs )
    {
        return fs * FS_BLOCK_SIZE / WII_BLOCK_SIZE;
    }

    function _getCurrentTitleBlocks()
    {
        if (typeof _titleInfo == "object")
        {
            if ( _isTmdPresent )
            {
                // tmd present (occupiedUserBlocks is valid), add 1 user block for eticket
                return ( _titleInfo.occupiedUserBlocks + eTicketBlocks );
            } else 
            { 
                // title owned, 1 user block for eticket
                trace2("eTicketBlocks::" + eTicketBlocks)
                return 1;
            }
        } else
        {
            //title not owned, no eticket
            return eTicketBlocks;
        }
    }

    /*
        privileged methods
    */
    /* get flag method */
    this.getIsOnDevice = function()
    {
        return _isOnDevice;
    };
    this.isUpdate = function()
    {
        if ( _isTmdPresent && _currentTitleVersion != null)
        {
            return ( titleVersion > _currentTitleVersion );
        } else {
            return false;
        }
    };
    this.checkDownloadSpace = function(sdMode)
    {
        //checking Downloading && Downloaded
        if( sdMode == 'Y' )
        {
            return ( _userBlocks.avail >= _newTitleMetaBlocks - _currentTitleBlocks && _allBlocks.avail  >= _newTitleBlocks);
        } else
        {
            //return ( _userBlocks.avail >= _newTitleBlocks - _currentTitleBlocks + 2 && _allBlocks.avail  >= _newTitleBlocks);
            return ( _userBlocks.avail >= _newTitleBlocks - _currentTitleBlocks && _allBlocks.avail  >= _newTitleBlocks);
        }
    };

    /* accessor methods */
    this.getAvailUserFSBlocks = function()
    {
        return _userBlocks.avail;
    };
    this.getAvailUserBlocks = function()
    {
        return Math.floor( _fs2WiiBlocks( _userBlocks.avail ) );
    };
    this.getNeededTitleBlocks = function(sdMode)
    {
        var retval = 0;
        if( sdMode == 'Y' )
        {
            if( _allBlocks.avail < _newTitleBlocks )
            {
                
                retval = Math.max( retval, _newTitleBlocks - _allBlocks.avail);
            }
            else
            {
                retval = Math.max( retval, _newTitleMetaBlocks - _currentTitleBlocks );
            }
        } 
        else
        {
            //Even if there is not enough available space in NAND, we show the total space 
            //to download a title. If DL title is 800FS, and NAND spae is only 200FS, we display
            //"please create 100 Blocks (100 blocks) of free space". 
            //For updated title, we show the difference of current title and new title.
            retval = Math.max( retval, _newTitleBlocks - _currentTitleBlocks );
        }
        trace2 ("retval:"+retval);
        return Math.ceil( _fs2WiiBlocks( retval ) );
    };
    this.getTitleKBSize = function()
    {
        return Math.ceil(titleSize / 1024);
    };
    this.getSDBackupBlocks = function()
    {
       var sdBackupSize = getSDBackupSize( titleSize );
       var sdBackupBlocks = _size2FsBlocks( sdBackupSize );
       return Math.ceil( _fs2WiiBlocks( sdBackupBlocks ) );
    };

    /* refresh funcstions */
    this.refreshDeviceInfo = function()
    {
        _deviceInfo = ec.getDeviceInfo();
        if ( typeof _deviceInfo == "object" )
        {
            FS_BLOCK_SIZE = _deviceInfo.blockSize;
            delete( _userBlocks );
            delete( _allBlocks );
            _userBlocks = new Blocks( _deviceInfo.totalBlocks, _deviceInfo.usedBlocks );
            _allBlocks  = new Blocks( _deviceInfo.totalBlocks + _deviceInfo.totalSysBlocks, _deviceInfo.usedBlocks + _deviceInfo.usedSysBlocks );
        }
    };
    this.refreshTitleInfo = function()
    {
        _titleInfo = ec.getTitleInfo( titleId );
        if ( typeof _titleInfo == "object" )
        {
            _isOnDevice          = _titleInfo.isOnDevice;
            _currentTitleVersion = _titleInfo.version;
            _isTmdPresent        = _titleInfo.isTmdPresent;
            _currentTitleBlocks  = _getCurrentTitleBlocks();
        }
    };

    /* debug code */
    this.traceLog = function()
    {
        trace2("titleId : "+ titleId);
        trace2("titleSize : "+ titleSize);
        trace2("tmdSizeOnServer : "+ tmdSizeOnServer);

        trace2("FS_BLOCK_SIZE:"+FS_BLOCK_SIZE);

        trace2("_userBlocks.total:"+_userBlocks.total);
        trace2("_userBlocks.used:"+_userBlocks.used);
        trace2("_userBlocks.avail:"+_userBlocks.avail);

        trace2("_allBlocks.total:"+_allBlocks.total);
        trace2("_allBlocks.used:"+_allBlocks.used);
        trace2("_allBlocks.avail:"+_allBlocks.avail);

        trace2("_isOnDevice:"+_isOnDevice);
        trace2("_currentTitleVersion:"+_currentTitleVersion);
        trace2("_isTmdPresent:"+_isTmdPresent);
        trace2("_currentTitleBlocks:"+_currentTitleBlocks);

        trace2("_newTitleBlocks :"+_newTitleBlocks);
        trace2("_newTitleMetaBlocks : "+_newTitleMetaBlocks);
    };

    /*
        initialize code
    */
    // these values are arguments
    titleId             += "";   //typeof titleId is String.
    titleSize           -= 0;    //typeof titleSize is Number.
    titleVersion        -= 0;    //typeof titleVersion is Number.
    tmdSizeOnServer     -= 0;    //typeof titleSize is Number.

    // refresh DeviceInfo
    this.refreshDeviceInfo();

    //eTicket Size is common value
    eTicketSize          = 676;  //typeof eTicketSize is Number.
    eTicketBlocks        = _size2FsBlocks( eTicketSize );

    // refresh TitleInfo
    this.refreshTitleInfo();

    // these values are title information on servers
    _newTitleBlocks        = _size2FsBlocks( titleSize );
    _newTitleTMDBlocks     = _size2FsBlocks( tmdSizeOnServer );
    _newTitleETicketBlocks = _size2FsBlocks( eTicketSize );
    _newTitleMetaBlocks    = _newTitleTMDBlocks + _newTitleETicketBlocks;
    // debug
    this.traceLog();
}
/*
    public methods
*/
// none public methods
trace2("TitleManager loaded");