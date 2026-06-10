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

function wiiLeftScroll() {
    wiiSelectSound();
}
function wiiRightScroll() {
    wiiSelectSound();
}

function wiiReturnSound() {
    wiiCancelSound();
}

// Get EULA page
function getEulaUrl()
{	
    if (ecSupportsSession()) {
    	return ec.getSessionValue("EULA");
    } else {
    	return null;
    }
}

function setEulaIFrame()
{

    var iframe = document.getElementById("EULA");
    if (iframe != null) {
    	try {    
    	    iframe.src = getEulaUrl();
    	} catch(err) {}
    }
}

function initPage()
{
    wiiEnableHRP();
    if (shop && "setWallpaper" in shop) {
    	shop.setWallpaper(cWP_VLine);
    }
    setEulaIFrame();
}

