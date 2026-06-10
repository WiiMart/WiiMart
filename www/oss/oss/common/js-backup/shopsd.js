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

//
//  SHOPSD library
//
function trace2(msg) {
    trace(msg);
    //var xml = new XMLHttpRequest();
    //xml.open("GET", "/oss/trace");
    //xml.setRequestHeader("msg", msg);
    //xml.send();
    return msg;
}
try {
    var objSD = new wiiSDCard();
} catch (err) {
    trace("Error new wiiSDCard: " + err);

    // For avoiding Error Check
    shopSDCheck = true;
}

// objSD.checkValidSD(titleId, titleSizeKB) : Check SD status (Error check)
// objSD.isInserted()            : Check if SD card is inserted in device
// objSD.getFreeKBytes()         : Get free SD area size (KBytes)
// objSD.setJournalFlag(titleId) : Set SD mode flag into NAND used during DL
// objSD.backupToSDCard(titleId) : Backup title data to SD
// objSD.hasProgressFinished()   : Check the progress and status of SHOPSDLib processing
// objSD.isJournalValue()        : Return value of SHOPSDIsJournaling()
// objSD.stopBackupToSDCard()    : Stop backupToSDCard
// objSD.setCancelJournal()      : Remove SD mode flag from NAND used during DL
// objSD.getSDBackupSize()       : Get necessary SD Backup Size
//
// Return code of checkValidSD (209630 + x) :
//   00) SDCARD_ERROR_OK_e                  =   0
//   01) SDCARD_ERROR_INVALID_e             =  -1 : ?
//   02) SDCARD_ERROR_EXISTS_e              =  -2 : ?
//   03) SDCARD_ERROR_NOEXISTS_e            =  -3 : ?
//   04) SDCARD_ERROR_UNKNOWN_FORMAT_e      =  -4 : ?
//   05) SDCARD_ERROR_INCORRECT_ALIGNMENT_e =  -5 : ?
//   06) SDCARD_ERROR_INCORRECT_DEVICE_e    =  -6 : ?
//   07) SDCARD_ERROR_NO_TICKET_e           =  -7 : ?
//   08) SDCARD_ERROR_ACCESS_e              =  -8 : ?
//   09) SDCARD_ERROR_CANCELLED_e           =  -9 : cancelBackupToSDCard successful?
//   10) SDCARD_ERROR_CONTENT_INVALID_e     = -10 : Banner is not found
//   11) SDCARD_ERROR_MAXFD_e               = -11 : ?
//   12) SDCARD_ERROR_OUT_OF_MEMORY_e       = -12 : ?
//   13) SDCARD_ERROR_CORRUPT_e             = -13 : NAND_CORRUPT_ERROR (Serious error)
//   14) SDCARD_ERROR_ECC_CRIT_e            = -14 : ?
//   15) SDCARD_ERROR_AUTHENTICATION_e      = -15 : ?
//   16) SDCARD_ERROR_FATAL_ERROR_e         = -16 : ?
//   17) SDCARD_ERROR_UNKNOWN_e             = -17 : ?
//   18) SDCARD_ERROR_SD_NOT_INSERTED_e     = -18 : SD Card is not inserted in device
//   19) SDCARD_ERROR_SD_NOT_SUPPORTED_e    = -19 : Unsupported type card (MMC and so on)
//   20) SDCARD_ERROR_SD_CORRUPT_e          = -20 : File system is broken
//   21) SDCARD_ERROR_SD_WRITE_PROTECTED_e  = -21 : SD card is locked
//   22) SDCARD_ERROR_SD_NO_SPACE_e         = -22 : ?
//   23) SDCARD_ERROR_SD_FAILED_e           = -23 : Other error
//   24) SDCARD_ERROR_SD_UNKNOWN_e          = -24 : Unknown error
//   25) SDCARD_ERROR_WANT_OF_CAPACITY_e    = -25 : Availavle space is not sufficient (SD)
//   26) SDCARD_ERROR_EXIST_CHECK_SOFT_e    = -26 : Same title is present in SD
//   27) SDCARD_ERROR_EXCEPTION_STATE_e     = -27 : Illegal statement (and cancelBackupToSDCard error)
//
// Server side)
//   31) EXIST_CHECK_SOFT_NAND
//   32) errChannel
//   33) errInodes
//   34) SD Backup timeout in B-10
//   35) JournalFlag error in B-10
//   36) Available space error in B-09 on checking remain size
//   37) Availavle space is not sufficient (NAND)
//
// Return value of hasBackupToSDCard :
//   > 0 : Success complete
//   = 0 : Now executing
//   < 0 : Error


var validSDValue = 0;
var insertedValue = 0;
var freeKBytesValue = 0;
var setJournalValue = 0;
var backupToSDValue = 0;
var hasProgressValue = 0;
var isJournalValue = false;
var stopBackupToSDValue = false;
var setCancelJournalValue = 0;
var getSDBackupSizeValue = 0;

function checkValidSD(titleIdForSD, titleSizeForSD) {
    if (objSD != null && "checkValidSD" in objSD) {
        validSDValue = 0;
        validSDValue = objSD.checkValidSD(titleIdForSD, titleSizeForSD);
    }
    return validSDValue;
}

function isInserted() {
    if (objSD != null && "isInserted" in objSD) {
        insertedValue = 0;
        insertedValue = objSD.isInserted();
    }
    return insertedValue;
}

function getFreeKBytes() {
    if (objSD != null && "getFreeKBytes" in objSD) {
        freeKBytesValue = 0;
        freeKBytesValue = objSD.getFreeKBytes();
    }
    return freeKBytesValue;
}

function setJournalFlag(titleIdForSD) {
    if (objSD != null && "setJournalFlag" in objSD) {
        setJournalValue = 0;
        setJournalValue = objSD.setJournalFlag(titleIdForSD);
    }
    return setJournalValue;
}

function backupToSDCard(titleIdForSD) {
    if (objSD != null && "backupToSDCard" in objSD) {
        backupToSDValue = 0;
        backupToSDValue = objSD.backupToSDCard(titleIdForSD);
    }
    return backupToSDValue;
}

function hasProgressFinished() {
    if (objSD != null && "hasProgressFinished" in objSD) {
        hasProgressValue = 0;
        hasProgressValue = objSD.hasProgressFinished();
    }
    return hasProgressValue;
}

function isJournaling() {
    if (objSD != null && "isJournaling" in objSD) {
        isJournalValue = false;
        isJournalValue = objSD.isJournaling();
    }
    return isJournalValue;
}

function stopBackupToSDCard() {
    if (objSD != null && "stopBackupToSDCard" in objSD) {
        stopBackupToSDValue = false;
        stopBackupToSDValue = objSD.stopBackupToSDCard();
    }
    return stopBackupToSDValue;
}

function setCancelJournal() {
    if (objSD != null && "setCancelJournal" in objSD) {
        setCancelJournalValue = 0;
        setCancelJournalValue = objSD.setCancelJournal();
    }
    return setCancelJournalValue;
}

function getSDBackupSize(titleSize) {
    if (objSD != null && "getSDBackupSize" in objSD) {
        getSDBackupSizeValue = 0;
        getSDBackupSizeValue = objSD.getSDBackupSize(titleSize);
    }
    return getSDBackupSizeValue;
}


function makeCheckSDIsInserted(){
    var sndSelectCancel = 0;
    var initSndSelectCancel = 0;
    return function ()
    {
        if (isInserted() == true) {
            document.getElementById("sdDisable").style.display = 'none';
            document.getElementById("spacer02").style.display = '';
            if (initSndSelectCancel == 0) {
                initSndSelectCancel++;
                sndSelectCancel = 1;
            }
            if (sndSelectCancel <= 0) {
                wiiSelectSound();
                sndSelectCancel = 1;
            }
        } else {
            document.getElementById("sdDisable").style.display = '';
            document.getElementById("spacer02").style.display = 'none';
            if (initSndSelectCancel == 0) {
                initSndSelectCancel++;
                sndSelectCancel = 0;
            }
            if (sndSelectCancel >= 1) {
                wiiCancelSound();
                sndSelectCancel = 0;
            }
        }
    };
}

function nonSDSupport()
{
    var nonSDSupport = false;
    var r = ec.getDeviceInfo();
    if (typeof(r) == "object") {
        if (r.country == 'TW' && r.region == 'TWN' && r.language == 'ja') {
            // SD pass when country is Taiwan
            nonSDSupport = true;
        }
    }
    return nonSDSupport;
}

function onControlButtonPressed(titleId)
{
	if (ecSupportsSession()) {
		ec.setSessionValue("showCtrlPage", "true");
	}
	var nextUrl = addParam('B_08.jsp', 'titleId', titleId);
	showPage(nextUrl);
}

function sdDLErrorHandle(titleId, titleSizeKB, redownloadFlag){
    var retVal = true;
    //In the case fail to detect whther SD is pulled 
    var sdError = checkValidSD(titleId, titleSizeKB);
    var sdError2 = checkValidSD(titleId, titleSizeKB);
    //If fail to detect 
    if (sdError != sdError2) {
        sdError = checkValidSD(titleId, titleSizeKB);
    }


    // Debug mode (please comment out this block when using for release)
    // if (sderrordebugvalue.value != "") {
    //     var sdError = sderrordebugvalue.value;
    // }

    // NAND has insufficient area (Block, Channel, i-nodes, title is in SD, title is in NAND)
    if (sdError == -25 || sdError == -32 || sdError == -33 || sdError == -26 || sdError == -31) {
        getErrorNoSize(sdError, redownloadFlag);
        retVal = false;
    }else if(sdError == -13){
        // NAND Corrupt error
        var nwc24 = new wiiNwc24 ;
        nwc24.dispError((sdError * -1) + 209630, 2);
        retVal = false;
    }else if(sdError < 0){
    // Other error
        getSDError(sdError, redownloadFlag);
        retVal = false;
    }else if (titleManager.getIsOnDevice()) {
    // If user wants to DL title to SD but it is already in NAND, this error is displayed
    //var t = ec.getTitleInfo (titleId);
        getErrorNoSize(-31, redownloadFlag);
        retVal = false;
    }
    return retVal;
}
trace2("shopsd.js loaded")
