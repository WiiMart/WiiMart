// ==UserScript==
// @name         Wii Shop Channel Polyfill
// @version      2024-02-03
// @description  Mocks WSC APIs normally provided by the channel itself
// @author       Sards
// @match        https://*/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=wii.com
// @run-at       document-start

// ==/UserScript==
let ECLogBuffer = [];
let ECLogStarted = false;
window.trace = function(data) {
    if (!parent.doTrace) return;
    console.trace(data);
    ECLogBuffer.push(data);
}

class wiiShop {
     constructor() {
          this.title = "Wii Shop Channel"
          this.menuBtn = "Wii Menu"
          this.retryBtn = "Try Again"
          this.getLogUrl = "http://oss.shop.wii.com/oss/getLog"
          this.connecting = "Connecting, please wait..."
          this.isCompatibleMode = 0;
     }

     enableHRP() { }
     disableHRP() { }
     returnToUpdate() { }
     setWallpaper() { }
     enableHRP() { }
     disableHRP() { }
     error(errcode, errortype) {
          console.error(`${errcode} ${errortype}`)
     }
     returnToMenu() { }
     beginWaiting() { }
     endWaiting() { }
}

window.wiiShop = wiiShop

class ECTicketInfo {
     constructor(id) {
          this.ticketId = "0000000000000000";
          this.titleId = id;
          this.nLimits = 0;
          this.limits = new ECTitleLimits();
          this.version = "0";
          this.deviceId = 0;
          this.ticketVersion = 0;
          this.licenseType = "PERMANENT";
          this.cidxMask = "AAA";
          this.reserved = "AAA";
     }
}

class ECTicketInfos {
     constructor(id) {
          this.get = function(index) {return [new ECTicketInfo(id)][index]}
          this.set = function() {console.error("Cannot set ticket info")}
     }
}

window.ECTicketInfos = ECTicketInfos

class ECTitleInfo {
    constructor() {
          return []
     }
}

class ECommerceInterface {

     constructor() {}

     set progress(value) {
         localStorage.setItem("__deviceProgress", JSON.stringify(value))
     }

     get progress() {
         return JSON.parse(localStorage.getItem("__deviceProgress", "{ status: 0 }")) || { status: 0 }
     }

     set tmds(value) {
         localStorage.setItem("__installedTMDs", JSON.stringify(value))
     }

     get tmds() {
         return JSON.parse(localStorage.getItem("__installedTMDs", "[]")) || []
     }
    startLog() {
        ECLogStarted = true;
        return "EC Log started";
    }
    getLog() {
        if (!ECLogStarted) return "EC Log not started";
        let logString = "";
        for (let i = 0; i < ECLogBuffer.length; i++) {
            logString += ECLogBuffer[i] + "\n";
        }
        return logString;
    }
    stopLog() {
        ECLogBuffer = [];
        ECLogStarted = false;
        return "EC Log stopped";
    }
    checkRegistration() {
         return {
             status: 0,
             operation: "Checking registration",
             phase: EC_ERROR_OK
         }
     }
     getSessionValue(key) {
          return localStorage.getItem(key)
     }

     setSessionValue(key, value) {
          return localStorage.setItem(key, value)
     }

     getTitleInfos() {
          return [];
     }

     reportCSS(callerType, helperId, helperIdKind, helpeeId, helpeeIdKind, survey, postalCode) {
          return ""
     }

     confirmCSS(callerType,
          helperId, helperIdKind,
          helpeeId, helpeeIdKind,
          confirmation, notes) {
          return ""
     }

     getDeviceInfo() {
         return {
               totalBlocks: 500000000,
               usedBlocks: 0,
               totalSysBlocks: 4000000,
               usedSysBlocks: 0,
               blockSize: 1,
               titleId: "0001000248414241",
               freeChannelAppCount: 500,
               maxUserInodes: 500,
               usedUserInodes: 4,
               deviceId: 0,
               serial: "",
               accountId: 0,
               registrationStatus: 'R',
               region: 'USA',
               language: 'en',
               country: 'US',
               accountCountry: 'US',

          }
          /*return {
               totalBlocks: 500000000,
               usedBlocks: 0,
               totalSysBlocks: 4000000,
               usedSysBlocks: 0,
               blockSize: 1,
               titleId: "0001000248414241",
               freeChannelAppCount: 500,
               maxUserInodes: 500,
               usedUserInodes: 4,
               deviceId: 4336584949,
               serial: "OW400603375",
               accountId: 86942084,
               registrationStatus: 'R',
               region: 'USA',
               language: 'en',
               country: 'US',

          }
         /*return {
               totalBlocks: 500000000,
               usedBlocks: 0,
               totalSysBlocks: 4000000,
               usedSysBlocks: 0,
               blockSize: 1,
               titleId: "0001000248414241",
               freeChannelAppCount: 500,
               maxUserInodes: 500,
               usedUserInodes: 4,
               deviceId: 4336584949,
               serial: "LU310714499",
               accountId: 12672734,
               registrationStatus: 'R',
               region: 'USA',
               language: 'en',
               country: 'US',
          }*/
     }
     sampleBody(requestType) {
          var info = this.getDeviceInfo()
          switch (requestType) {
               case "CheckDeviceStatus":
                    return `<?xml version="1.0" encoding="UTF-8"?>
                      <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
                                         xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
                                         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                                         xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                                         xmlns:ecs="urn:ecs.wsapi.broadon.com">
                     <SOAP-ENV:Body>
                     <ecs:CheckDeviceStatus xsi:type="ecs:CheckDeviceStatusRequestType">
                       <ecs:Version>2.0</ecs:Version>
                       <ecs:MessageId>ECSHOP-${info.deviceId}-47535810338964350</ecs:MessageId>
                       <ecs:DeviceId>${info.deviceId}</ecs:DeviceId>
                       <ecs:DeviceToken>WT-34dcd99cb304662f302f7855c038afd2</ecs:DeviceToken>
                       <ecs:AccountId>${info.accountId}</ecs:AccountId>
                       <ecs:Region>USA</ecs:Region>
                       <ecs:Country>US</ecs:Country>
                       <ecs:Language>en</ecs:Language>
                       <ecs:SerialNo>${info.serial}</ecs:SerialNo>
                       </ecs:CheckDeviceStatus>
                     </SOAP-ENV:Body>
                     </SOAP-ENV:Envelope>`
          }

     }
    downloadTitle(titleId) {
           this.progress = {
               status: -4009,
               operation: "Downloading",
               phase: EC_PHASE_DownloadingContent
           }

           setTimeout(() => {
               this.tmds = [...this.tmds, titleId]
               this.progress = {
                   status: 0,
                   operation: "Downloading",
                   phase: EC_ERROR_OK
               }
           }, 1000)
           return this.progress
    }

    getWeakToken() {
        return "6AacQwB5zz49kzx4g5Ixx"
    }

     getTitleInfo(id) {
          return {
               isTmdPresent: this.tmds.includes(id),
               version: 1,
               isOnDevice: false,
               occupiedUserBlocks: 0
          }
     }

     setWebSvcUrls() {}
     setContentUrls() {}

     getProgress() {
          return this.progress
     }

     cancelOperation() {
          return
     }

     checkDeviceStatus() {
          /*var info = this.getDeviceInfo();
          var req = fetch('', {
               method: 'POST',
               headers: {
                    'SOAPAction': 'urn:ecs.wsapi.broadon.com/CheckDeviceStatus'
               },
               body: this.sampleBody("CheckDeviceStatus")
          })*/
          return this.getProgress()
     }

     refreshCachedBalance() {
          return this.getProgress()
     }

     getCachedBalance() {
          return localStorage.getItem("points");
     }

     getTicketInfos(id) {
          return new ECTicketInfos(id);
     }

     purchaseTitle(titleId, itemId, price, payment, limits, downloadContent, _, purchaseInfo, discount) {
          console.log(titleId, itemId, price, payment, limits, downloadContent, _, purchaseInfo, discount)
          return {
               status: EC_ERROR_OK
          }
     }

     pubKeyEncrypt(str) {
         return `Encrypted String: ${btoa(str)}`
     }

     syncTickets(type) {
          return {
               status: EC_ERROR_OK
          }
     }

     purchasePoints(pointsToBuy, itemId, price, payment, taxes, purchaseInfo, discount) {
          localStorage.setItem("points", pointsToBuy);
          return {
               status: EC_ERROR_OK
          }
     }

     getPurchaseInfo() {
          return "info";
     }
}

window.ECommerceInterface = ECommerceInterface

class ECTitleLimits {

}

window.ECTitleLimits = ECTitleLimits

class ECAccountPayment {

}
window.ECAccountPayment = ECAccountPayment

class ECPrice {
     constructor(value, type) {
          this.value = value
          this.type = type
     }
}

window.ECPrice = ECPrice

class wiiSDCard {
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

     checkValidSD() { return 0 }
     isInserted() { return true }
     getFreeKBytes() { return 50000 }
     getSDBackupSize() { return 0 }
}

window.wiiSDCard = wiiSDCard

class wiiKeyboard {
     /**
     * Brings up a keyboard.
     * @param {number} type Type of keyboard. See also: https://docs.oscwii.org/wii-shop-channel/js/keyboard
     * @param {number} rowLimit Number of rows the user should be able to type.
     * @param {boolean} isPasswordField Whether to treat text entered as a password or not.
     * @param {string} title Content to show as a hint while typing.
     */
    call (type, rowLimit, isPasswordField, title) {
        console.log(`Called keyboard type ${type} with row limit ${rowLimit} and password field ${isPasswordField} with title "${title}"`);
    }
}

window.wiiKeyboard = wiiKeyboard;

class ECCreditCardEncryptedPayment {
     constructor(lastFourDigits) {
          this.lastFourDigits = lastFourDigits;
     }
}

window.ECCreditCardEncryptedPayment = ECCreditCardEncryptedPayment;

class wiiNwc24 {
     constructor() {

     }
     getFriendNum() {
          return [{}];
     }
     getFriendInfo(num, type) {
          return "Friend";
     }
}
window.wiiNwc24 = wiiNwc24;
/**
 * Go to a page with the "-pc" removed
 * @param {string} page 
 */
parent.goto = function(page) {
     showPage(page.replace('-pc', ''))
}