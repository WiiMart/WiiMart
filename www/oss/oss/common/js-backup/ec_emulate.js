function ECommerceInterface ()
{
    this.isOperationActive = ec_isOperationActive;
    this.getProgress = EC_GetProgress;
    this.purchaseTitle = EC_PurchaseTitle;
    this.redeemECard = EC_RedeemECard;
    this.syncTickets = EC_SyncTickets;
    this.refreshCachedBalance = EC_RefreshCachedBalance;
    this.purchasePoints = EC_PurchasePoints;
    this.downloadTitle = EC_DownloadTitle;
    this.getUpdatedApps = EC_GetUpdatedApps;
    this.registerVirtualConsole = EC_RegisterVirtualConsole;
    this.getTitleInfo = EC_GetTitleInfo
    this.listOwnedTitles = EC_ListOwnedTitles
    
    this.getDeviceInfo = EC_GetDeviceInfo;
    this.setLanguage = EC_SetLanguage;
    this.setCountry = EC_SetCountry;
    this.setRegion = EC_SetRegion;
    this.setAge = EC_SetAge;
    this.setVirtualConsoleId = EC_SetVirtualConsoleId;
    this.setWebSvcURLs = EC_SetWebSvcURLs;
    this.setContentURLs = EC_SetContentURLs;
    this.checkParentalControlPassword = EC_CheckParentalControlPassword;
    this.deleteTitleContent = EC_DeleteTitleContent;
    this.deleteTitle = EC_DeleteTitle;
    this.deleteTicket = EC_DeleteTicket;
    this.deleteLocalTicket = EC_DeleteLocalTicket;
    this.launchTitle = EC_LaunchTitle;

    this.initOwnedTitles = ec_initOwnedTitles    
    this.addOwnedTitle = ec_addOwnedTitle;
    
    this.progress = new ECProgress();
    this.onDone = null;
    this.opId = 0;    // by convention 0 not a valid opId
    this.nextOpId = 1;
    this.maxProgressInc = 40;
    this.minProgressInc = 15;
    this.progressCount = 0;
    this.progressCountMax = 5;
    this.cachedBalance = 0;
    
    this.deviceId = 0x8104a127d8;
    this.serial = 1234567
    this.vcid = null;
    this.pin = "InitialPin";
    this.country = "US";
    this.region = "US";
    this.language = "en";
    this.blockSize = 16*1024;
    this.usedBlocks = 0;
    this.totalBlocks = (128*1024*1024)/this.blockSize;
    this.userAge = null;
    this.isParentalControlEnbaled = true;
    this.parentalControlPasswd = "thePasswd";
    this.isNeedTicketSync = false;
    
    // the following is not necessary, but documents the properties
    this.purchasedPoints = null;
    this.titleId = null;
    this.ticketId = null;
    this.eCard = null;
    this.usedECards = null;
    this.ecsURL = null;
    this.icsURL = null;
    this.ccsURL = null;
    this.ucsURL = null;
    this.taxes = null;
    this.purchaseInfo = null;
    this.discount = null;
    
    this.initOwnedTitles ();  // initialize this.ownedTitles
}

function ec_isOperationActive()
{
    return this.progress.status == EC_ERROR_NOT_DONE;
}

function ECProgress ()
{
    this.init = progress_init;
    this.init (null, null, 0);
}

function progress_init (op, phase, totalSize)
{
    if (op == null) {
        this.status = EC_ERROR_NOT_BUSY;
    }
    else {
        this.status = EC_ERROR_NOT_DONE;
    }
    this.operation = op;
    this.descripton = null;
    this.phase = phase;
    this.downloadedSize = 0;
    this.totalSize = totalSize;
    this.errInfo = null;
    this.result = EC_INVALID_MONEY_AMOUNT;   
}

var count = 0;
function EC_GetProgress ()
{
    var progress = this.progress;
    
    if (this.isOperationActive()) {
        if (progress.status == EC_ERROR_NOT_DONE) {
            if (progress.totalSize) {
     	        progress.downloadedSize += progress.totalSize * 
     	            Math.max (this.minProgressInc,
                              Math.round(Math.random() * this.maxProgressInc))
                              / 100;
                progress.downloadedSize = Math.round(progress.downloadedSize);
                if (progress.downloadedSize >= progress.totalSize) {
            	    progress.downloadedSize = progress.totalSize;
            	    progress.status = EC_ERROR_OK;
                }
            }
            else if (++this.progressCount > this.progressCountMax) {         	
         	    progress.status = EC_ERROR_OK;
                    this.progressCount = 0;
            }
            if (progress.status == EC_ERROR_OK
                  && this.onDone != null) {
                progress.status = this.onDone();
            }
        }
    }

    return progress;
}


function EC_RefreshCachedBalance ()
{
    var progress;

    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("refreshCachedBalance", EC_PHASE_GettingPointsBalance, 0);
        this.onDone = ec_onRefreshCachedBalanceDone;
    }
       
    return progress;
}

function ec_onRefreshCachedBalanceDone ()
{
    this.cachedBalance += 1000;  // Just so we see a change
    return EC_ERROR_OK;
}


//////////////////////////////////////////////////////////
//
//   Object constructors and methods for EC_PurchasePoints
//
// ECCreditCardPayment, ECECardPayment, and ECAccountPayment objects
// have a paymentMethod property initialized in the object constructor.
//


var EC_CreditCardKinds = new Array();
EC_CreditCardKinds[EC_CreditCardKind_MasterCard] = "MasterCard";
EC_CreditCardKinds[EC_CreditCardKind_Visa] = "Visa";
EC_CreditCardKinds[EC_CreditCardKind_Discover] = "Discover";
EC_CreditCardKinds[EC_CreditCardKind_Amex] = "American Express";
EC_CreditCardKinds[EC_CreditCardKind_DinersClub] = "DinersClub";
EC_CreditCardKinds[EC_CreditCardKind_JCB] = "JCB";




function ECCreditCardPayment (ccNumber)
{
    this.paymentMethod = EC_PaymentMethod_CreditCard;
    this.ccNumber = ccNumber;
}

function ECECardPayment (eCardNumber)
{
    this.paymentMethod = EC_PaymentMethod_ECard;
    this.number = eCardNumber;
}

function ECAccountPayment ()
{
    // already have account (i.e. vcid) and pin in console file
    
    this.paymentMethod = EC_PaymentMethod_Account;
    this.id = "";
    this.password = "";
}

function ECPrice (amount, currency)
{
    this.amount = amount;
    this.currency = currency;
}


function EC_PurchasePoints (points, itemId, price, payment)
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("purchasePoints",
                       EC_PHASE_PurchasingPoints, 0);
        this.onDone = ec_onPurchasePointsDone;
        this.purchasedPoints = points;
        this.itemId = itemId;
        this.price = price;
        this.payment = payment; // Each payment has paymentMethod property
        var nArgs = arguments.length;
        this.taxes = "";
        this.purchaseInfo = "";
        this.discount = "";
        if (nArgs > 4) { this.taxes = arguments[4]; }
        if (nArgs > 5) { this.purchaseInfo = arguments[5]; }
        if (nArgs > 6) { this.discount = arguments[6]; }
    }
       
    return progress;
}

function ec_onPurchasePointsDone ()
{
    this.cachedBalance += this.purchasedPoints;
    return EC_ERROR_OK;
}






// titleId is a hex string
// itemId is a number or string
// price is an ECPrice object
// payment is an ECPayment object
// limits is an array of ECTitleLimit object
// 
function EC_PurchaseTitle (titleId,
                           itemId,
                           price,
                           payment,
                           limits)
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("purchaseTitle", EC_PHASE_PurchasingTitle, 8*1024*1024);
        this.onDone = ec_onPurchaseTitleDone;
        this.titleId = titleId;
        this.titleLimits = limits;
        var nArgs = arguments.length;
        this.taxes = "";
        this.purchaseInfo = "";
        this.discount = "";
        if (nArgs > 4) { this.taxes = arguments[4]; }
        if (nArgs > 5) { this.purchaseInfo = arguments[5]; }
        if (nArgs > 6) { this.discount = arguments[6]; }
    }
       
    return progress;
}

function ec_onPurchaseTitleDone ()
{
    var isOnDevice = true;
    var ticketId = this.titleId;
    var isUpdateAvailable = false;
    var limits = this.titleLimits;
    this.addOwnedTitle (this.titleId, ticketId, isOnDevice, isUpdateAvailable, limits);
    
    return EC_ERROR_OK;
}

function ec_addOwnedTitle (titleId, ticketId, isOnDevice, isUpdateAvailable, limits)
{
    // using integer index values allows use of ownedTitles.length
    // otherwise would do ownedTitles[titleId} = new EC_TiteInfo (...);
    var i = this.ownedTitles.length;
    this.ownedTitles[i] = new ECOwnedTitle (titleId,
                                            ticketId,
                                            isOnDevice,
                                            isUpdateAvailable, limits);
    this.ownedTitles[titleId] =  i;
    
}


function EC_RedeemECard (eCard, titleId)
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("redeemECard", EC_PHASE_RedeemingECard, 8*1024*1024);
        this.onDone = ec_onRedeemECardDone;
        this.titleId = titleId;
        this.eCard = eCard;
    }
       
    return progress;
}

function ec_onRedeemECardDone ()
{
    var isOnDevice = true;
    var ticketId = this.titleId;
    var isUpdateAvailable = false;
    var limits = new ECTitleLimits ();  // no limits
    this.addOwnedTitle (this.titleId, ticketId, isOnDevice, isUpdateAvailable, limits);
    
    if (this.usedECards != null) {
        this.usedECards += "|";
    }
    this.usedECards + this.eCard;
    
    return EC_ERROR_OK;
}


function EC_SyncTickets (since)
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("syncTickets", EC_PHASE_GettingTicketsFromServer, 0);
        this.onDone = ec_onSyncTicketsDone;
    }
       
    return progress;
}

function ec_onSyncTicketsDone ()
{
    return EC_ERROR_OK;
}


function EC_DownloadTitle (titleId)
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else if (this.ownedTitles[titleId] == null) {
        progress = new ECProgress();
        progress.status = EC_ERROR_NOT_FOUND;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("downloadTitle", EC_PHASE_DownloadingContent, 8*1024*1024);
        this.onDone = ec_onGetTitleDone;
        this.titleId = titleId;
    }
       
    return progress;
}

function ec_onGetTitleDone ()
{
    var rv;
    var ownedTitles = this.ownedTitles;
    var i = ownedTitles[this.titleId];
    if (i == null) {
        rv = EC_ERROR_FAIL;  // can't get title not owned
    }
    else {
         ownedTitles[i].isOnDevice = true;
         rv = EC_ERROR_OK;
    }
    
    return rv;
}


function EC_GetUpdatedApps ()
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("getUpdatedApps", EC_PHASE_GettingUpdatedAppVersions, 0);
        this.onDone = ec_onGetUpdatedAppsDone;
    }
       
    return progress;
}

function ec_onGetUpdatedAppsDone ()
{
   // set update for some title
   var i;
   var t;
   for (i = 0;  i < this.ownedTitles.length; ++i) {
       t = this.ownedTitles[i];
       if (t.isOnDevice && !t.isUpdateAvailable) {
           t.isUpdateAvailable = true;
           break;
       }
   }
   return EC_ERROR_OK;
}



function EC_RegisterVirtualConsole ()
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else {
        this.opId = rv = this.nextOpId++;
        progress = this.progress;
        progress.init ("registerVirtualConsole", EC_PHASE_RegisteringVirtualConsole, 0);
        this.onDone = ec_onRegisterVirtualConsoleDone;
    }
       
    return progress;
}


function ec_onRegisterVirtualConsoleDone ()
{
    this.vcid = Math.round(Math.random() * 16384);
    this.pin = "consolePin";
    return EC_ERROR_OK;
}


//////////////////////////////////////////////////////////////////////////////////
//
//        TitleInfo object and function definitions
//
//



// constructor for ECTitleLimit object
//
// code is a string used in the infrastructure database
// that corresponds to values defined in eTicket Services doc
// and estypes.h.
//
// valid codes are
//
//      "PR", // no limit  == 0
//      "TR", // ES_LC_DURATION_TIME == 1
//      "DR", // ES_LC_ABSOLUTE_TIME == 2
//      "SR", // ES_LC_NUM_TITLES == 3
//      "LR"  // ES_LC_NUM_LAUNCH == 4
//
// limit and consumed are numbers.
//
// units for limit and consumed duration values is seconds
// absolute time is seconds since 1970.1.1 UTC

function ECTitleLimit (code, limit, consumed)
{
    if (code != "PR" &&
        code != "TR" &&
        code != "DR" &&
        code != "SR" &&
        code != "LR") {
        
        this.code = null;
        this.limit = null;
        this.consumed = null;
        this.hasConsumption = false;
    }
    else {
        this.code = code;
        this.limit = limit;
        this.consumed = consumed;
        this.hasConsumption = (consumed == null) ? false : true;
        
    }
}


// constructor for ECTitleLimits object
// properties:  length
// methods:  get set
//
// constructor takes variable number of ECTitleLimit args
//
function ECTitleLimits ()
{
    var i;
    var nArgs = arguments.length;
    if (nArgs > ES_MAX_LIMIT_TYPE) {
       nArgs = ES_MAX_LIMIT_TYPE;
    }
    
    this.limits = new Array ();
    for (i = 0;  i < nArgs;  ++i) {
        if (arguments[i] instanceof ECTitleLimit) {
            this.limits[i] = arguments[i];
        }
        else {
            break;
        } 
    }
    
    this.get = titleLimits_get;
    this.set = titleLimits_set;
    this.length = this.limits.length;
}

function titleLimits_get (index)
{
    return this.limits[index];
}

function titleLimits_set (index)
{
    if (index < ES_MAX_LIMIT_TYPE) {
        if (arguments.length == 2) {
            this.limits[index] = arguments[1];
        }
        else if (arguments.length == 3) {
            limit = new ECTitleLimit (arguments[1], arguments[2]);
            this.limits[index] = limit;
        }
        else {
            this.limits[index] = null;
        }
        this.length = this.limits.length;
   }
}



// constructor for ECOwnedTitle object
//
// isOnDevice is true means title has been downloaded to console
// and imported into eTicket Services
// limits is an array of ECTitleLimit objects

function ECOwnedTitle (titleId, ticketId, isOnDevice, isUpdateAvailable, limits)
{
    this.titleId = titleId;
    this.ticketId = ticketId;
    this.isOnDevice = isOnDevice;
    this.isUpdateAvailable = isUpdateAvailable;
    this.version = 1;
    this.latestVersion = 2;
    this.sizeToDownload = 0;
    this.nLimits = limits.length;
    this.limits = limits;
}


    
// constructor for ECOwnedTitles object
//

function ECOwnedTitles ()
{
    this.ownedTitles = new Array();
    this.get = ECOwnedTitles_get;
    this.set = ECOwnedTitles_set;
    this.length = 0
}

function ECOwnedTitles_get (index)
{
    if (this.ownedTitles.length) {
       return this.ownedTitles[index];
    }
    else {
       return new ECOwnedTitles()
    }
    // could return an error for test
}

function ECOwnedTitles_set (index, ecOwnedTitle)
{
    this.ownedTitles[index] = ecOwnedTitle;
    this.length = this.ownedTitles.length;
}


    
 function ec_initOwnedTitles ()
 {
     var i;
     var titleId = 0x0001000000008000;
     var ticketId = titleId;
     var isOnDevice;
     var limit;
     var limits;
     var isUpdateAvailable;
     
     this.ownedTitles = new Array();
     
     for (i = 0;  i < 5;  ++i) {
         ++titleId;
         ticketId = titleId;
         isUpdateAvailable = false;
         isOnDevice = false;
         switch (i) {
            case 2:
                isUpdateAvailable = true;
            case 0:
            case 4:
                isOnDevice = true;;
                break;
            default:
                break;
         }
         switch (i) {
            case 3:
                limit = new ECTitleLimit ("TR",
                                           (60*60*24*30), // 30 day limit
                                           (60*60*24*5)); // 5 days consumed);
                limits = new ECTitleLimits (limit);
                break;
            default:
                limits = new ECTitleLimits ();  // no limits
                break;
         }
         this.addOwnedTitle (hex16DigitId(titleId),
                             hex16DigitId(ticketId),
                             isOnDevice, isUpdateAvailable, limits);
     }
 }
    
    
// EC_GetTitleInfo (titleId)
//
// returns an ECOwnedTitle object or ECError
//
//

function EC_GetTitleInfo (titleId)
{
   var rv = EC_ERROR_NOT_FOUND;
   var i = this.ownedTitles[titleId];
   if (i != null) {
       rv = this.ownedTitles[i];
   }
   return rv;
}



// EC_ListOwnedTitles ()
//
// Returns an ECOwnedTitles or ECError
//
// If no titles are owned, ECOwnedTitles length will be 0
//
// Note: use for(i=0; i < rv.length; i++) rather than for (t in rv)
//
function EC_ListOwnedTitles ()
{
   var titles = new ECOwnedTitles();
   var i;
   for (i = 0;  i < this.ownedTitles.length;  ++i) {
      titles.set(i, this.ownedTitles[i]);
   }
   return titles;
}





// returns an object with device info parameters
//
// Does not start asynchronous operation
//
function EC_GetDeviceInfo ()
{
   var r = new Object ();
   
   r.deviceId = this.deviceId
   r.serial = this.serial
   r.vcid = this.vcid
   r.country = this.country
   r.region = this.region
   r.language = this.language
   r.blockSize = this.blockSize
   r.usedBlocks = this.usedBlocks
   r.totalBlocks = this.totalBlocks
   r.userAge = this.userAge
   r.isParentalControlEnabled = this.isParentalControlEnbaled;
   r.isNeedTicketSync = this.isNeedTicketSync;
   
   return r;
}


// Does not start asynchronous operation
//
function EC_SetLanguage (language)
{
    this.language = language;
       
    return EC_ERROR_OK;
}

// Does not start asynchronous operation
//
function EC_SetCountry (country)
{
    this.country = country;
       
    return EC_ERROR_OK;
}

// Does not start asynchronous operation
//
function EC_SetRegion (region)
{
    this.region = region;
       
    return EC_ERROR_OK;
}

// Does not start asynchronous operation
//
function EC_SetAge (age)
{
    this.userAge = age;
       
    return EC_ERROR_OK;
}

// Does not start asynchronous operation
//
function EC_SetVirtualConsoleId (vcid, password)
{
    this.vcid = vcid;
    this.pin = password;
       
    return EC_ERROR_OK;
}

// Does not start asynchronous operation
//
function EC_SetWebSvcURLs (ecsURL, iasURL)
{
    this.ecsURL = ecsURL;
    this.icsURL = iasURL;
       
    return EC_ERROR_OK;
}

// Does not start asynchronous operation
//
function EC_SetContentURLs (ccsURL, ucsURL)
{
    this.ccsURL = ccsURL;
    this.ucsURL = ucsURL;
       
    return EC_ERROR_OK;
}






// Does not start asynchronous operation
//
// Returns true if password is correct
//         fail if password is not correct
//
function EC_CheckParentalControlPassword (passwd)
{
    if (this.parentalControlPasswd == passwd)           
        return true;
    else
        return false;
}



// Does not start asynchronous operation
//
function EC_DeleteTitleContent (titleId)
{
    return EC_ERROR_OK;
}


// Does not start asynchronous operation
//
function EC_DeleteTitle (titleId, ticketId)
{
    return EC_ERROR_OK;
}


function EC_DeleteTicket (titleId, ticketId)
{
    var progress;
    
    if (this.isOperationActive()) {
        progress = new ECProgress();
        progress.status = EC_ERROR_BUSY;
    }
    else if (this.ownedTitles[titleId] == null) {
        progress = new ECProgress();
        progress.status = EC_ERROR_NOT_FOUND;
    }
    else {
        this.opId = this.nextOpId++;
        progress = this.progress;
        progress.init ("deleteTicket", EC_PHASE_DeleteTicket, 0);
        this.onDone = ec_onDeleteTicketDone;
        this.titleId = titleId;
        this.ticketId = ticketId;
    }
       
    return progress;
}

function ec_onDeleteTicketDone ()
{
    var rv;
    var ownedTitles = this.ownedTitles;
    var i = ownedTitles[this.titleId];
    if (i == null) {
        rv = EC_ERROR_FAIL;  // can't delete title not owned
    }
    else {
         ownedTitles[this.titleId] = null;
         rv = EC_ERROR_OK;
    }
    
    return rv;
}



// Does not start asynchronous operation
//
function EC_DeleteLocalTicket (titleId, ticketId)
{
    return EC_ERROR_OK;
}



// Does not start asynchronous operation
//
function EC_LaunchTitle (titleId, ticketId)
{
    return EC_ERROR_OK;
}





function hex16DigitId (number)
{
    if (typeof(number) != "number") {
        return number;
    }
    
    return ("0000000000000000" + number.toString(16)) .slice(-16);
}



function trace ()
{
    return;
}

