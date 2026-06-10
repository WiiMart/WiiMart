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
//  keyboard type
//
var cKT_Default     = 0 ;  // (Default)                           �W���^�C�v
var cKT_Letter      = 1 ;  // (Letter)                            �莆�^�C�v
var cKT_Num         = 2 ;  // (Numeric)                           �e���L�[
var cKT_NoLF        = 3 ;  // (without Line Feed)                 ���s�̂Ȃ��m�[�}���^�C�v
var cKT_LNoLF       = 4 ;  // (Large text w/o Line Feed)          ���s�̂Ȃ��傫�������̃m�[�}���^�C�v
var cKT_NoLFS       = 5 ;  // (w/o Line Feed and Sign)            Qwerty�݂̂ŁA���s�ƋL���E�C���h�E�̂Ȃ��^�C�v
var cKT_LNoLFS      = 6 ;  // (Large text w/o Line Feed and Sign) ���̃e�L�X�g�ł�����
var cKT_NumD        = 7 ;  // (Numeric w Dot)                     �h�b�g�������L�[
var cKT_LNumD       = 8 ;  // (Large text Numeric w Dot)          �h�b�g�������L�[�f�J�e�L�X�g
var cKT_NumSep      = 9 ;  // (Numeric w Separator)               �Z�p���[�^�������L�[
var cKT_PredictNoLF = 10 ; // (Predict w/o Line Feed)             ���s�Ȃ��ϊ�

var kbd = new wiiKeyboard();

//
//  kbd.call( keyboardtype, limitrow=1, secret=false, title="" )
//
trace2("keyboard.js loaded");