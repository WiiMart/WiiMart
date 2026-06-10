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

//---------------------------------------------------------------------
// Functions related to showing the progress of an async function call
//---------------------------------------------------------------------
var useProgressBar = false;
var progressCount;

function setText1 (dynText1, optStyle1)
{
	if (dynText1 != null) {
    	var d1 = document.getElementById("dynDiv1");
        d1.innerHTML = dynText1;
        if (optStyle1 != null) {
        	d1.className = optStyle1;
        }
    }
}

function setText2 (dynText2, optStyle2)
{
	if (dynText2 != null) {
    var d2 = document.getElementById("dynDiv2");
    d2.innerHTML = dynText2;
    	if (optStyle2 != null) {
        	d2.className = optStyle2;
        }
    }
}

function setErr (errText, optStyle)
{
	var d = document.getElementById("errDiv");
    d.innerHTML = errText;
    if (optStyle == null) {
    	d.className = "errText";
    } else  {
    	d.className = optStyle;
    }
}

function showProgress(firstTime, operation, description, onDone)
{
	var msg;
    var text1;
    var text2;
    var s1;
    var done = true;
    var isFailed = true;
    var onDoneText;
    
    var progress = ec.getProgress();
            
    if (progress.status == EC_ERROR_NOT_BUSY) {
    	return;
    }

    if (useProgressBar) {
	    var timeInterval = 1000;
        var message1;
        var message2 = null;
        if (progress.totalSize) {
        	message1 = operation + " progress: ";
        } else {
        	progressCount = 0;
            message1 = operation + ". Please Wait.";
        }

        // use default color,height,width,style
        var color = null;
        var height = null;
        var width = null;
        var style = null;
        setText1 (description, "progressText");
        setErr ("");
//      disableButtons (true);
        showProgressBar("ec", "defTbpFunc", onDone,
                        "dynDiv2", timeInterval,
                        message1,message2,
                        color,height,width,style);
    }
    else {
     	if (progress.status == EC_ERROR_NOT_DONE) {
	    	// showDebug (progress.phase);
            msg = operation;
            if (progress.totalSize) {
                // not expected except when downloading content
                var perCent = Math.round((100 * progress.downloadedSize)
                                          / progress.totalSize);
                msg += ":  downloadedSize " + progress.downloadedSize +
                       "   totalSize "   + progress.totalSize +
                       "   " + perCent + "%";
            }
            else {
                if (firstTime || dots.length == 10) {
                    dots = "";
                }
                dots += "**";
                msg += ": Please wait.  " + dots;
            }
            setText1 (msg);
 
            if (firstTime) {
                setText2 (description);
                setErr ("");
                //disableButtons (true);
            }
            setTimeout ('showProgress(false,"' + operation + '","' + description
                                    + '","' + onDone + '")', 1000);
        }
        else {
            eval (onDone+"(progress)");
        }
    }
}

function showProgressResult (progress, operation, description)
{
    var t1;
    var s1;
    var rv = progress.status;
    if (rv == EC_ERROR_NOT_DONE) {
    	t1 = "Internal Error: showResult was called before operation finished";
        s1 = "errText";
    }
    else if (rv == EC_ERROR_NOT_BUSY || rv == EC_ERROR_NOT_ACTIVE) {
        t1 = "Internal Error: expected operation status " +
             "but ec.getProgress() returned: " + getECErrorMsg(rv);
        s1 = "errText";
    }
    else if (rv < 0) {
        t1 = description + ": Failed: " + getECErrorMsg(rv);
        s1 = "errText";
    }
    else {
        t1 = description + ": Success";
        s1 = "successText";
    }

    setText1 (t1, s1);
    var errDetail = getErrorDetail(rv, progress.errCode, progress.errInfo);
    if (errDetail == null) {
    	setText2 ("");
    	trace(t1);
    } else {
        setText2 (errDetail);
        trace(t1 + ": " + errDetail);
    }
     setErr (""); // op errors are displayed by setText1 (t1)
}

function defTbpFunc (barPerCent, progress)
{
	// Returns progess text and bar %.  see updateProgress().
    // The 'tbp' stands for text and bar per cent.
    // default meaning of progess.value is  0 to 99 per cent
    // but could be used diferently for different operations.
    // The tbpFunction is not normally called by updateProgess
    // when progress.value is 100, because at that point the
    // operation is complete and onDone is called instead.

    if (progress.totalSize) {
    	// not expected except when downloading content
        barPerCent.value = Math.round((100 * progress.downloadedSize) / progress.totalSize);
        return barPerCent.value + "%";
    } else {
        if (++progressCount > 4) {
        	barPerCent.value = 10;
            count = 1;
        } else {
            barPerCent.value = 20 * progressCount;
        }
        return null;
    }
}

//-------------------------------------------------------------------
//
// Progress Bar
//
// This is a javascript that simulates a progress bar on the page.
// The progress is based on the return value of an external functional call
//
// Usage: showProgressBar(ec,tbpFunction,doneFunction,divObj,
//                        timeInterval,message1, message2,
//                        color,height,width,style)
//   ecVarName    - ECommerceInterface object variable name string
//   tbpFunction  - returns progess text and bar %.  see updateProgress()
//                   (tbp stands for text and bar per cent)
//   doneFunction - javascript function to call upon completion
//   divObj       - id of the div object that act as a container of this progress bar
//   timeInterval - time interval (milliseconds) to obtain the status and update the progress bar
//   message1     - a msg string to display before the progress %
//   message2     - a msg string to display after  the progress %
//   color        - color for the bar/outer boundary of the box 
//   height       - height of the box/bar
//   width        - total width of the box/bar 
//   style        - style for the message string displayed above the progress bar
//
// Requirements: Following code must be included in the page
//
//     var ec = new ECommerceObj;  // global variable
//
//     <DIV id="divObj"></DIV>
//
// Where the name used for ec and divObj are passed as args to showProgressBar.
//
//-------------------------------------------------------------------

function showProgressBar(ecVarName,tbpFunction,doneFunction,divObj,
                         timeInterval,message1,message2,
                         color,height,width,style)
{
    var pbColor = (color!=null && color!='') ? color : "#006666";
    var pbHeight = (height!=null && height!='') ? height : "20";
    var pbWidth = (width!=null && width!='') ? width : "400";
    var msgString1 = (message1!=null && message1!='') ? message1 : "";
    var msgString2 = (message2!=null && message2!='') ? message2 : "";
    var msgStyle = (style!=null && style!='') ? style : "font:bold; color:#FA8072;";

    document.getElementById(divObj).innerHTML = ''
             + '      <table width="90%"  border="0" cellspacing="0" cellpadding="0">'
             + '        <tr>'
             + '          <td width="7%" valign="top" align="right">'
             + '            <img src="' + imagesPath + '/04.gif" width="26" height="57" border="0">'
             + '          </td>'
             + '          <td width="88%" background="' + imagesPath + '/bg_26.gif" align="center">'
             + '            <table width="100%"  border="0" cellspacing="0" cellpadding="0">'
             + '              <tr>'
             + '                <td height="19">&nbsp;</td>'
             + '              </tr>'
             + '              <tr>'
             + '                <td>'
             + '                  <DIV id="box" align="left" style="background-color:#FFFFFF; border:1 solid '
             + pbColor + '; height:' + pbHeight + 'px; width:' + pbWidth + '; visibility:visible;">'
             + '                  <DIV id="bar" align="left" style="position:static; background-color:'
             + pbColor + '; height:' + pbHeight + 'px; width:0px; padding-top:5;"></DIV></DIV>'
             + '                </td>'
             + '              </tr>'
             + '            </table>'
             + '            <br>'
             + '          </td>'
             + '          <td width="5%" valign="top">'
             + '            <img src="' + imagesPath + '/03.gif" width="26" height="57" border="0">'
             + '          </td>'
             + '        </tr>'
             + '        <tr>'
             + '          <td></td>'
             + '          <td align="left" height="40" valign="middle">'
             + '            <DIV id="msg" align="center" style="'+msgStyle+'">center</DIV>'
             + '          </td>'
             + '          <td></td>'
             + '        </tr>'
             + '      </table>';

    updateProgress(ecVarName,tbpFunction,doneFunction,timeInterval,msgString1,msgString2,pbWidth);
}

//-------------------------------------------------------------------
//
// The progress bar will keep obtaining the status after every timeInterval milliseconds
//
//-------------------------------------------------------------------

function updateProgress(ecVarName,tbpFunction,doneFunction,timeInterval,
                      msgString1,msgString2,barSize)
{
    var result;
    var m;
    var barPerCent = new Object();
    eval("var progress = " +ecVarName+".getProgress();");
    
    if (progress.status != EC_ERROR_NOT_DONE) {
         document.getElementById('msg').innerText = "";
         document.getElementById('box').style.visibility = 'hidden';
         eval(doneFunction+"(progress)");
         return;
    }
    
    eval("result = " +tbpFunction+"(barPerCent, progress);");
    
    m = document.getElementById('msg');
    
    if (msgString1 != null)
        m.innerHTML = msgString1;
    if (result != null)
        m.innerHTML += " " + result;
    if (msgString2 != null)
        m.innerHTML += msgString2;

    document.getElementById('bar').style.width = barPerCent.value + '%';

    setTimeout("updateProgress(\""+ecVarName+"\",\""+
        tbpFunction+"\",\""+doneFunction+"\",\""+timeInterval+"\",\""+
        msgString1+"\",\""+msgString2+"\",\""+barSize+"\");", timeInterval);

}
