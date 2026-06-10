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
function trace2(msg) {
    trace(msg);
    //var xml = new XMLHttpRequest();
    //xml.open("GET", "/oss/trace");
    //xml.setRequestHeader("msg", msg);
    //xml.send();
    return msg;
}
        
/* ECError values */
var EC_ERROR_OK                   =     0;  /* No error */
var EC_ERROR_FAIL                 = -4001;  /* Generic error */
var EC_ERROR_NOT_SUPPORTED        = -4002;  /* Feature not implemented */
var EC_ERROR_INSUFFICIENT_RESOURCE = -4003;
var EC_ERROR_INVALID              = -4004;
var EC_ERROR_NOMEM                = -4005;
var EC_ERROR_NOT_FOUND            = -4006;
var EC_ERROR_NOT_BUSY             = -4007;  /* no active async operation */
var EC_ERROR_BUSY                 = -4008;
var EC_ERROR_NOT_DONE             = -4009;
                                  
var EC_ERROR_NET_NA               = -4013;  /* Internet access not available */
var EC_ERROR_WS_REPORT            = -4015;  /* Server reports a problem */
var EC_ERROR_ECARD                = -4017;  /* Invalid eCard */
var EC_ERROR_OVERFLOW             = -4018;  /* Output too big for buf provided */
                                            /* Should never see EC_E~~RROR_OVERFLOW */                                  
var EC_ERROR_NET_CONTENT          = -4019;  /* Error getting content from server */
var EC_ERROR_CONTENT_SIZE         = -4020;  /* Downloaded content size doesn't match tmd */
                                  
var EC_ERROR_WS_RESP              = -4034;  /* invalid web service response */
var EC_ERROR_TICKET               = -4035;  /* problem importing ticket */
var EC_ERROR_TITLE                = -4036;  /* problem importing title */
var EC_ERROR_TITLE_CONTENT        = -4037;  /* problem importing title content */
var EC_ERROR_CANCELED             = -4038;  /* an extended operation was canceled */
var EC_ERROR_ALREADY              = -4039;  /* one time only action was previously done */

var EC_ERROR_INIT                 = -4041;  /* library has not been initialized */
var EC_ERROR_REGISTER             = -4042;  /* device is not registered */
var EC_ERROR_WS_RECV              = -4043;  /* recv error on web service response */
var EC_ERROR_NOT_ACTIVE           = -4044;  /* expected operation is not active op */
var EC_ERROR_FILE_READ            = -4045;
var EC_ERROR_FILE_WRITE           = -4046;

var EC_ERROR_NOT_OWNED            = -4050;  /* Title is not owned */
var EC_ERROR_BAD_HEAP             = -4051;  /* Bad heap */
var EC_ERROR_HTTP_HDR_PARSE       = -4052;  /* Could not parse http header */
var EC_ERROR_CONFIG               = -4053;  /* Invalid configuration (e.g. url is invalid) */
var EC_ERROR_CANCEL_FAILED        = -4054;  /* Could not cancel asynchronous operaton */
var EC_ERROR_USER_INODES          = -4055;  /* Operation would exceed max user inodes */
var EC_ERROR_USER_BLOCKS          = -4056;  /* Operation would exceed max user blocks */
var EC_ERROR_SYS_INODES           = -4057;  /* Operation would exceed max sys inodes */
var EC_ERROR_SYS_BLOCKS           = -4058;  /* Operation would exceed max sys blocks */

var EC_ERROR_NO_DEVICE_CODE       = -4065;  /* Operation requires device code */
var EC_ERROR_SYNC                 = -4066;  /* Operation requres ticket sync */
var EC_ERROR_CONNECT              = -4069;  /* Operation requires EC_Connect() */
var EC_ERROR_NO_TMD               = -4070;  /* Title TMD is not on device */
var EC_ERROR_FIRMWARE             = -4071;  /* Title requires updated firmware */

var EC_ERROR_INVALID_PCPW         = -4074;  /* Parental control password doesn't match */
var EC_ERROR_PC_DISABLED          = -4075;  /* Parental control is not enabled */
var EC_ERROR_EULA                 = -4076;  /* Customer has not agreed to EULA */
var EC_ERROR_AGE_RESTRICTED       = -4077;  /* Opration requires parental control password */
var EC_ERROR_POINTS_RESTRICTED    = -4078;  /* Opration requires parental control password */
var EC_ERROR_ALREADY_OWN          = -4079;  /* Attempt purchase already owned item */
var EC_ERROR_SHOP_SETUP           = -4080;  /* Shop channel setup not done or cleared */
var EC_ERROR_INSUFFICIENT_FUNDS   = -4081;  /* Not enough funds to purchase the item */


var EC_ERROR_RANGE_START          = -4000;
var EC_ERROR_RANGE_END            = -4199;

var EC_ISFS_ERROR_START           =  -101;
var EC_ISFS_ERROR_END             =  -199;
var EC_ES_ERROR_START             = -1000;
var EC_ES_ERROR_END               = -1999;
var EC_HTTP_STATUS_RANGE_START    = -4400;   /* corresponds to http status 100 */
var EC_HTTP_STATUS_RANGE_END      = -4899;
var EC_NHTTP_ERROR_RANGE_START    = -4900;
var EC_NHTTP_ERROR_RANGE_END      = -4959;
var EC_SSL_ERROR_RANGE_START      = -4960;
var EC_SSL_ERROR_RANGE_END        = -4979;
var EC_NHTTP_APIERR_RANGE_START   = -4980;
var EC_NHTTP_APIERR_RANGE_END     = -4999;

/* Unexpected NHTTP API errors */
var EC_ERROR_NHTTP_CRX            = -4992;
var EC_ERROR_NHTTP_AHF            = -4993;
var EC_ERROR_NHTTP_SCCD           = -4994;
var EC_ERROR_NHTTP_SRCD           = -4995;
var EC_ERROR_NHTTP_SVO            = -4996;
var EC_ERROR_NHTTP_PDE            = -4997;
var EC_ERROR_NHTTP_PDR            = -4998;
var EC_ERROR_NHTTP_SRA            = -4999;

/* -101 to - max ISFS error are ISFS errors
 * -1000 to - max ESError are errors returned by ES
 * -4400 to -4899 correspond to http status codes 100 to 599
 * -4900 to -4959 are NHTTPError values
 * -4960 to -4979 are values returned by NHTTPSSLGetError()
 * -4980 to -4999 are unexpected HHTTP API errors
 */ 


/* NHTTP Errors */
var  NHTTP_ERROR_NONE            =  0;
var  NHTTP_ERROR_ALLOC           =  1;
var  NHTTP_ERROR_TOOMANYREQ      =  2;
var  NHTTP_ERROR_SOCKET          =  3;
var  NHTTP_ERROR_DNS             =  4;
var  NHTTP_ERROR_CONNECT         =  5;
var  NHTTP_ERROR_BUFFULL         =  6;
var  NHTTP_ERROR_HTTPPARSE       =  7;
var  NHTTP_ERROR_CANCELED        =  8;
var  NHTTP_ERROR_REVOLUTIONSDK   =  9;
var  NHTTP_ERROR_REVOLUTIONWIFI  = 10;
var  NHTTP_ERROR_UNKNOWN         = 11;
var  NHTTP_ERROR_DNS_PROXY       = 12;
var  NHTTP_ERROR_CONNECT_PROXY   = 13;
var  NHTTP_ERROR_SSL             = 14;

/* SSL errors returned by NHTTPSSLGetError() */
var  SSL_ENONE                   =   0;
var  SSL_EFAILED                 =  -1;
var  SSL_EWANT_READ              =  -2;
var  SSL_EWANT_WRITE             =  -3;
var  SSL_ESYSCALL                =  -5;
var  SSL_EZERO_RETURN            =  -6;
var  SSL_EWANT_CONNECT           =  -7;
var  SSL_ESSLID                  =  -8;
var  SSL_EVERIFY_COMMON_NAME     =  -9;
var  SSL_EVERIFY_ROOT_CA         = -10;
var  SSL_EVERIFY_CHAIN           = -11;
var  SSL_EVERIFY_DATE            = -12;
var  SSL_EGET_SERVER_CERT        = -13;


var ES_MAX_LIMIT_TYPE  = 8;
var EC_INVALID_MONEY_AMOUNT = (-2147483647-1);

var EC_PHASE_NoPhase                        =  0;
var EC_PHASE_Starting                       =  1;
var EC_PHASE_Done                           =  2;
var EC_PHASE_PurchasingTitle                =  3;
var EC_PHASE_RedeemingECard                 =  4;  // deprecated
var EC_PHASE_DownloadingContent             =  5;
var EC_PHASE_GettingTicketsFromServer       =  6;
var EC_PHASE_GettingPointsBalance           =  7;
var EC_PHASE_PurchasingPoints               =  8;
var EC_PHASE_CheckingRegistrationStatus     = 11;
var EC_PHASE_Registering                    = 12;
var EC_PHASE_Unregistering                  = 13;
var EC_PHASE_Transfer                       = 14;
var EC_PHASE_DeletingOwnership              = 15;


var EC_INVALID_ACCOUNT_ID = "";


var EC_PaymentMethod_ECard      = 0;
var EC_PaymentMethod_Account    = 1;
var EC_PaymentMethod_CreditCard = 2;


var ECOPT_JS_TEST_MODE        = 0;  /* can never set from JavaScript */
var ECOPT_LOG_LEVEL           = 1;
var ECOPT_RE_DOWNLOAD_CONTENT = 2;
var ECOPT_INVALID             = 3;

var EC_JS_TM_OFF = 0;
var EC_JS_TM_ON  = 1;

var  EC_LOG_NONE    =  0;
var  EC_LOG_ERR     =  1;
var  EC_LOG_WARN    =  2;
var  EC_LOG_INFO    =  3;
var  EC_LOG_FINE    =  4;
var  EC_LOG_FINER   =  5;
var  EC_LOG_FINEST  =  6;

var SC_NET_CONTENT_RESTRICTION_MASK_NEWS          = 0x00000001;
var SC_NET_CONTENT_RESTRICTION_MASK_NWC24_MESSAGE = 0x00000002;
var SC_NET_CONTENT_RESTRICTION_MASK_SHOPPING      = 0x00000004;

var EC_SYNC_TYPE_UPDATE = "1";
var EC_SYNC_TYPE_IMPORT_ALL = "0";

var EC_REGION_JPN = "JPN"; // Japan
var EC_REGION_USA = "USA"; // America
var EC_REGION_EUR = "EUR"; // Europe
var EC_REGION_AUS = "AUS"; // Australia
var EC_REGION_BRA = "BRA"; // Brazil
var EC_REGION_TWN = "TWN"; // Taiwan
var EC_REGION_KOR = "KOR"; // Korea
var EC_REGION_HKG = "HKG"; // Hong Kong
var EC_REGION_ASI = "ASI"; // Asia
var EC_REGION_LTN = "LTN"; // Latin America
var EC_REGION_SAF = "SAF"; // South Africa
var EC_REGION_CHN = "CHN"; // China

var ES_LIMIT_CODE_TR = "TR"; /* ES_LC_DURATION_TIME - limit in seconds */
var ES_LIMIT_CODE_DR = "DR"; /* ES_LC_ABSOLUTE_TIME - limit in seconds since epoch */
var ES_LIMIT_CODE_SR = "SR"; /* ES_LC_NUM_TITLES */
var ES_LIMIT_CODE_LR = "LR"; /* ES_LC_NUM_LAUNCH */

var ES_LICENSE_MASK         = 0x0f;
var ES_LICENSE_PERMANENT    = 0x00;
var ES_LICENSE_DEMO         = 0x01;
var ES_LICENSE_TRIAL        = 0x02;
var ES_LICENSE_RENTAL       = 0x03;
var ES_LICENSE_SUBSCRIPTION = 0x04;
var ES_LICENSE_GIFT_MASK    = 0x80;

var ES_LICENSE_PERMANENT_STRING = "PERMANENT";
var ES_LICENSE_DEMO_STRING = "DEMO";
var ES_LICENSE_TRIAL_STRING = "TRIAL";
var ES_LICENSE_RENTAL_STRING = "RENTAL";
var ES_LICENSE_SUBSCRIPTION_STRING = "SUBSCRIPTION";

var ES_LICENSE_TYPE_TO_STRING = new Array();
ES_LICENSE_TYPE_TO_STRING[ES_LICENSE_PERMANENT] = ES_LICENSE_PERMANENT_STRING;
ES_LICENSE_TYPE_TO_STRING[ES_LICENSE_DEMO] = ES_LICENSE_DEMO_STRING;
ES_LICENSE_TYPE_TO_STRING[ES_LICENSE_TRIAL] = ES_LICENSE_TRIAL_STRING;
ES_LICENSE_TYPE_TO_STRING[ES_LICENSE_RENTAL] = ES_LICENSE_RENTAL_STRING;
ES_LICENSE_TYPE_TO_STRING[ES_LICENSE_SUBSCRIPTION] = ES_LICENSE_SUBSCRIPTION_STRING;

var ES_STRING_TO_LICENSE_TYPE = new Array();
ES_STRING_TO_LICENSE_TYPE[ES_LICENSE_PERMANENT_STRING] = ES_LICENSE_PERMANENT;
ES_STRING_TO_LICENSE_TYPE[ES_LICENSE_DEMO_STRING] = ES_LICENSE_DEMO;
ES_STRING_TO_LICENSE_TYPE[ES_LICENSE_TRIAL_STRING] = ES_LICENSE_TRIAL;
ES_STRING_TO_LICENSE_TYPE[ES_LICENSE_RENTAL_STRING] = ES_LICENSE_RENTAL;
ES_STRING_TO_LICENSE_TYPE[ES_LICENSE_SUBSCRIPTION_STRING] = ES_LICENSE_SUBSCRIPTION;

var GIFT_OWNED      = "200"; /* Indicates the gift receiver already owns the title */
var GIFT_COUNTRY    = "201"; /* Indicates the receiver country setting does not match the senders */
var GIFT_REJECT     = "202"; /* Indicates the receiver rejected the gift */
var GIFT_EXPIRED    = "203"; /* Indicates the sender's gift has expired */
var GIFT_SETTINGS   = "204"; /* Indicates the receiver's console settings prevent gifting */
var GIFT_EXPIRED_CS = "205"; /* Indicates Consumer Service expired the gift */

var EC_ACCEPT_GIFT_MIN_INODES = 8;     /* The minimum inodes needed to do ec.acceptGiftTitle */
var EC_ACCEPT_GIFT_MIN_DEVICE_SPACE = 3;    /* The minimum device blocks needed to do ec.acceptGiftTitle */
var EC_ACCEPT_GIFT_MIN_USER_SPACE = 1;      /* The minimum user blocks needed to do the ec.acceptGiftTitle */

var WIFI_PARTIALLY_CHARGED = 1;   /* partially charged WIFI */
var WIFI_FREE_INPUT = 2;          /* free input text for WIFIPAY */
var WIFI_ALL_CHARGED = 3;         /* all charged WIFI */




// Error Check
ecCheck = true;



trace2("ec.js loaded")
