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
function setButtonOnClick(id, onclick)
{
   if (onclick != null) {
       var elem = document.getElementById(id);
       if (elem != null) {
           elem.onclick = onclick;
       }
   }
}

function setButtonLink(id, link)
{
    if (link != null) {
	    var elem = document.getElementById(id);
	    if (elem != null) {
	        elem.href = link;
	    }
    }
}

function setButtonText(id, text)
{
    if (text != null) {
	    var elem = document.getElementById(id);
	    if (elem != null) {
            elem.innerHTML = '<table width="100%" height="100%"><tr><td align="center" valign="middle" class="buttonTextBlackM">' + text + '</td></tr></table>';
	    }
    }
}

function setButtonDisplay(id, show)
{
    if (show != null) {
	    if (show) {
	    	showElement(id);
	    } else {
		    hideElement(id);
	    }
    }
}

function setUnderButtonR(show, text, link, onclick)
{
    setButtonLink("underlinkR", link);
    setButtonText("underwordR", text);
    setButtonOnClick("underimageR", onclick);
    setButtonDisplay("underButtonR", show);
}

function setUnderButtonL(show, text, link, onclick)
{
    setButtonLink("underlinkL", link);
    setButtonText("underwordL", text);
    setButtonOnClick("underimageL", onclick);
    setButtonDisplay("underButtonL", show);
}

function setUnderButtonLSide(show, text, link, onclick)
{
    setButtonLink("underlinkLSide", link);
    setButtonText("underwordLSide", text);
    setButtonOnClick("underimageLSide", onclick);
    setButtonDisplay("underButtonLSide", show);
}

function setUnderButtonRSide(show, text, link, onclick)
{
    setButtonLink("underlinkRSide", link);
    setButtonText("underwordRSide", text);
    setButtonOnClick("underimageRSide", onclick);
    setButtonDisplay("underButtonRSide", show);
}

function setUnderButton(show, text, link, onclick)
{
    setButtonLink("underlink", link);
    setButtonText("underword", text);
    setButtonOnClick("underimage", onclick);
    setButtonDisplay("underButton", show);
}

function disableUnderButtonL()
{
    hideElement("underspacerL");
}

function enableUnderButtonL()
{
    showElement("underspacerL");
}

function disableUnderButtonR()
{
    hideElement("underspacerR");
}

function enableUnderButtonR()
{
    showElement("underspacerR");
}

function disableUnderButton()
{
    hideElement("underspacer");
}

function enableUnderButton()
{
    showElement("underspacer");
}

function disableWiiPointButton()
{
    if(document.getElementById("balanceInfo")) {
	    document.getElementById("balanceInfo").onclick='';
	    document.getElementById("balanceInfo").onmouseover='';
    }
}

function hideElement(element)
{
	var obj = document.getElementById(element);
	if(obj)
		obj.style.display='none';
}

function showElement(element)
{
	var obj = document.getElementById(element);
	if (obj) {
		obj.style.display='';
    }
}

function disableTopHelpElements()
{
	showElement('MainSpacer');
	showElement('HelpSpacer');

	showElement('TopGrayImageID');
	showElement('ManualGrayImageID');
	hideElement('TopImageID');
	hideElement('ManualImageID');
}

function enableTopHelpElements()
{
	hideElement('MainSpacer');
	hideElement('HelpSpacer');

	showElement('TopImageID');
	showElement('ManualImageID');
	hideElement('TopGrayImageID');
	hideElement('ManualGrayImageID');
}

function showTopHelpElements()
{
        document.getElementById("tophelpshadow").style.display='';
        document.getElementById("help").style.display='';
        document.getElementById("top").style.display='';
        document.getElementById("line01").style.display='';
        document.getElementById("upperLineLong").style.display='none';

}

function hideTopHelpElements()
{
        document.getElementById("tophelpshadow").style.display='none';
        document.getElementById("help").style.display='none';
        document.getElementById("top").style.display='none';
        document.getElementById("line01").style.display='none';
        document.getElementById("upperLineLong").style.display='';
}


// Error Check
buttonsCheck = true;

trace2("buttons.js loaded")
