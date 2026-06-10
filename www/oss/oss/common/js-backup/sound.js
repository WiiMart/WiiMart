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
//  Sound Effect ID
//
var cSE_Slide  = 1 ;
var cSE_Forcus = 2 ;
var cSE_Decide = 3 ;
var cSE_Cancel = 4 ;
var cSE_Choise = 5 ;
var cSE_Error  = 6 ;
var cSE_AddPoint  = 7 ;
var cSE_CopyFinish  = 8 ;
var cSE_SmallJump  = 9 ;
var cSE_LargeJump  = 10 ;
var cSE_FireBall  = 11 ;
var cSE_CoinCollect  = 12 ;
var cSE_BlockHit  = 13 ;
var cSE_CopyStart  = 14 ;
var cSE_Load  = 15 ;

var WIPL_SE_CHAR_DELETE_ERROR  = 6 ;

//
//  JavaScript Object
//
var snd = new wiiSound();


//
//  snd.playSE( soundeffectid );
//
//
//  snd.playBGM() : play BGM
//

function wiiFocusSound() {
    if (snd) { snd.playSE( cSE_Forcus ); }
}
function wiiSelectSound() {
    if (snd) { snd.playSE( cSE_Decide ); }
}
function wiiCancelSound() {
    if (snd) { snd.playSE( cSE_Cancel ); }
}

function wiiPlayBGM() {
    if (snd) { snd.playBGM(); }
}

// Error Check
soundCheck = true;

trace2("sound.js loaded")
