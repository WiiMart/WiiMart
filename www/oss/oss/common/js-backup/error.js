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
// Range for all OSS errors
var OSS_ERROR_RANGE_START              = 200000;
var OSS_ERROR_RANGE_END                = 209999;

// Range for OSS web service errors
var OSS_WS_ERROR_RANGE_START           = 205000;
var OSS_WS_ERROR_RANGE_END             = 206999;

// Range for OSS errors that cames from eclib and os
var OSS_OS_ERROR_RANGE_START           = 200000
var OSS_EC_ERROR_RANGE_START           = 204000;
var OSS_EC_ERROR_RANGE_END             = 204999;
var OSS_OS_ERROR_RANGE_END             = 204999;

var OSS_ERROR_OK                       =      0;

// ECS error codes
var ECS_ACCOUNT_MISMATCH               = 205672;

// IAS error codes
var IAS_BAD_DEVICE_CODE                = 205968;

// Discount error
var OSS_ERROR_PROMO_OVER               = 206112;

// OSS error codes
var OSS_ERROR_INVALID_PARAM            = 206601;
var OSS_ERROR_NO_PROGRESS              = 206660;
var OSS_ERROR_CREDIT_CARD_TYPE         = 206661;
var OSS_ERROR_INVALID_NUMBER           = 206662;
var OSS_ERROR_IN_PROGRESS              = 206663;
var OSS_ERROR_NO_SECURITY_CODE         = 206664;

var OSS_ERROR_PIN_INCORRECT            = 206650;
var OSS_ERROR_SERIAL_INCORRECT         = 206651;
var OSS_ERROR_PIN_INCORRECT_THRICE     = 206652;
var OSS_ERROR_REGISTER_LOYALTY_ERROR   = 206653;

var OSS_ERROR_INVALID_GAMECARD_NUMBER  = 206667;
var OSS_ERROR_PREPAID_OVERFLOW         = 206668;
var OSS_ERROR_INVALID_PREPAID_NUMBER   = 206669;
var OSS_ERROR_INVALID_WII_NUMBER       = 206670;

var OSS_INVALID_SHOP_APP_BAD_TITLE_ID  = 206671;
var OSS_INVALID_SHOP_APP_NO_TITLE_INFO = 206672;
var OSS_INVALID_REGISTRATION_STATUS    = 206673;
var OSS_UNEXPECTED_ECLIB_ERROR         = 206674;

// NOA error codes

var NOA_ERROR_CountyRequired				= 208000;
var NOA_ERROR_FoundOnBlacklist				= 208001;
var NOA_ERROR_BillingAddress				= 208002;
var NOA_ERROR_InvalidCardType                           = 208003;
var NOA_ERROR_InvalidVfyValue                           = 208004;
var NOA_ERROR_InvalidCcNumberAndExpDate                 = 208005;
var NOA_ERROR_InvalidCreditCardNumber			= 208006;
var NOA_ERROR_InvalidExpDate				= 208007;
var NOA_ERROR_InvalidPostalCode                         = 208008;
var NOA_ERROR_TechnicalDifficulties			= 208009;
var NOA_ERROR_TryAgainLater				= 208010;

var NOA_RESULT_ERROR_CreditCardDeclined			= 208011;
var NOA_RESULT_ERROR_CreditCardDeclined_Funds		= 208012;
var NOA_RESULT_ERROR_CreditCardDeclined_Inactive	= 208013;
var NOA_RESULT_ERROR_CreditCardDeclined_Exp		= 208014;
var NOA_RESULT_ERROR_CreditCardDeclined_Code		= 208015;
var NOA_RESULT_ERROR_CreditCardDeclined_CCNum		= 208016;
var NOA_RESULT_ERROR_CreditCardDeclined_Limit		= 208017;
var NOA_RESULT_ERROR_CreditCardDeclined_Invalid		= 208018;
var NOA_RESULT_ERROR_CreditCardDeclined_AVS		= 208019;

var NOA_ERROR_REFUND_CheckReq				= 208021;
var NOA_ERROR_REFUND_Exists				= 208022;
var NOA_ERROR_REFUND_Problem				= 208023;

var NOA_ERROR_EmptyVfyValue				= 208025;



// Defined PAS error code
var PAS_ERROR_CODE                                      = 205825;


// Takes a progress object and returns the OSS error code to be displayed to the user
function getOssErrorCode(progress)
{
    var status = progress.status;
    var errCode = progress.errCode;
    var ossError;

    if (status >= 0) {
        return OSS_ERROR_OK;
    } else if (status == EC_ERROR_WS_REPORT) {
    	if (errCode != null && errCode > 0) {
    	    ossError = OSS_WS_ERROR_RANGE_START + errCode;
    	    if (ossError > OSS_WS_ERROR_RANGE_END) {
    	        ossError = OSS_WS_ERROR_RANGE_START;
    	    }
    	    return ossError;
       	}
    } else if (status == EC_ERROR_NET_CONTENT ||
               status == EC_ERROR_FAIL ||
    	       status == EC_ERROR_WS_RECV) {
    	if (errCode != null && errCode < 0) {
    	    ossError = OSS_OS_ERROR_RANGE_START - errCode;
    	    if (ossError > OSS_OS_ERROR_RANGE_END) {
    	        ossError = OSS_OS_ERROR_RANGE_START;
    	    }
    	    return ossError;
       	}
    } 
        
    if (status < 0) {
        ossError = OSS_OS_ERROR_RANGE_START - status;
        if (ossError > OSS_OS_ERROR_RANGE_END) {
       	    ossError = OSS_OS_ERROR_RANGE_START;
       	}
    }
    return ossError;
}

// Helper functions for converting error code to error messages
// ECommerce error codes (errCode is progress.status)
function getECErrorMsg (errCode)
{
    var a = new Array();
    
    a[0]                                = "OK";
    a[-(EC_ERROR_FAIL)]                 = "An error has occurred.";
    a[-(EC_ERROR_NOT_SUPPORTED)]        = "This feature is not implemented.";
    a[-(EC_ERROR_INSUFFICIENT_RESOURCE)] = "Insufficient resources";
    a[-(EC_ERROR_INVALID)]              = "Invalid argument";
    a[-(EC_ERROR_NOMEM)]                = "Insufficient memory";
    a[-(EC_ERROR_NOT_FOUND)]            = "Not found";
    a[-(EC_ERROR_NOT_BUSY)]             = "There is no active operation.";
    a[-(EC_ERROR_BUSY)]                 = "There is already an active operation.";
    a[-(EC_ERROR_NOT_DONE)]             = "The operation has not completed yet.";

    a[-(EC_ERROR_NET_NA)]               = "Internet access is not available.";
    a[-(EC_ERROR_WS_REPORT)]            = "The server reported a problem.";
    a[-(EC_ERROR_ECARD)]                = "The prepaid card is invalid.";

    a[-(EC_ERROR_NET_CONTENT)]          = "There was an error downloading content.";
    a[-(EC_ERROR_CONTENT_SIZE)]         = "The size of downloaded content is different from the expected size.";

    a[-(EC_ERROR_WS_RESP)]              = "The web service response is invalid.";
    a[-(EC_ERROR_TICKET)]               = "Problem importing ticket";
    a[-(EC_ERROR_TITLE)]                = "Problem importing title";
    a[-(EC_ERROR_TITLE_CONTENT)]        = "Problem importing title content";
    a[-(EC_ERROR_CANCELED)]             = "An extended operation was canceled.";
    a[-(EC_ERROR_ALREADY)]              = "One time only action was previously done";
                                           
    a[-(EC_ERROR_INIT)]                 = "The ECommerce library has not been initialized.";
    a[-(EC_ERROR_REGISTER)]             = "The device is not registered.";

    a[-(EC_ERROR_WS_RECV)]              = "There was an error receiving the web service response.";
    a[-(EC_ERROR_NOT_ACTIVE)]           = "The expected operation is not the active operation.";

    a[-(EC_ERROR_FILE_READ)]            = "There was an error reading a file.";
    a[-(EC_ERROR_FILE_WRITE)]           = "There was an error writing a file.";

    a[-(EC_ERROR_NOT_OWNED)]            = "The title is not owned.";
    a[-(EC_ERROR_BAD_HEAP)]             = "An invalid heap was passed to the ECommerce library.";
    a[-(EC_ERROR_HTTP_HDR_PARSE)]       = "There was an error parsing the HTTP header.";
    a[-(EC_ERROR_CONFIG)]               = "Invlaid configuration (e.g. url is invalid)";

    var msg = a[-errCode];

    if (msg == null) {
        msg = "Unrecognized error code: " + errCode;
    }
    
    return msg;
}

// More detailed error message
function getErrorDetail(status, errCode, errInfo)
{
    var msg = null;
    if (errCode != null) {
        trace("errCode: " + errCode);
        var httpError = errCodeToHTTPStatus(errCode);
        trace("httpError: " + httpError);
        if (httpError != 0) {
	    msg = getHTTPErrorMsg(httpError);
        trace("msg: " + msg);
        } else {
	    var nhttpError = errCodeToNHTTPStatus(errCode);
        trace("nhttpError: " + nhttpError);
	    if (nhttpError != 0) {
	        msg = getNHTTPErrorMsg(nhttpError);
            trace("msg: " + msg)
	    }
        }
    } 
	
    if (status != EC_ERROR_OK && msg == null) {
       if (errInfo != null) {
           msg = errInfo;
       } else if (errCode != 0) {
           msg = "Error Code " + errCode;
       }
    }
	
    return msg;
}

/* returns 0 if not in HTTPStatus ECError range */
function errCodeToHTTPStatus (errCode)
{
    if (errCode > EC_HTTP_STATUS_RANGE_START || errCode < EC_HTTP_STATUS_RANGE_END) {
        return 0;
    } else {
        return (-(errCode - EC_HTTP_STATUS_RANGE_START)) + 100;
    }
}

/* returns 0 if not in NHTTPStatus ECError range */
function errCodeToNHTTPStatus (errCode)
{
    if (errCode > EC_NHTTP_ERROR_RANGE_START || errCode < EC_NHTTP_ERROR_RANGE_END) {
        return 0;
    } else {
        return (-(errCode - EC_NHTTP_ERROR_RANGE_START));
    }
}

function getHTTPErrorMsg(errCode)
{
	return "HTTP Status Code: " + errCode;
}

function getNHTTPErrorMsg(errCode)
{
	return "Network error code: " + errCode;
}


function setErrorMsg(errCode, errText)
{
	var code=document.getElementById("errorCodePlaceholder");
	var text=document.getElementById("errorTextPlaceholder");
	
	if(code && errCode){
		code.innerHTML=errCode;
		showElement("errorCodeText");
	}
	else {
		hideElement("errorCodeText");
	}
	
	if(text && errText) {
		text.innerHTML=errText;
		showElement("errorText");
	}
	else {
		hideElement("errorText");
	}
}


// Error Check
errorCheck = true;

trace2("error.js loaded")
