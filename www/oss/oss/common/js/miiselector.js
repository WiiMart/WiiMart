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

var NJSL = window.NJSL || {};
NJSL.MiiSelector = function (args) { this.constructor(args); };

NJSL.MiiSelector.prototype = { 

  MAX_MII    : 100,
  SIZE_QUERY : "width=64&height=64", 
  COLOR_QUERY: [
    "bgR=47&bgG=153&bgB=215",
    "bgR=41&bgG=146&bgB=208",
    "bgR=35&bgG=139&bgB=201",
    "bgR=29&bgG=132&bgB=195",
    "bgR=24&bgG=126&bgB=189" ],
  SELECTED_COLOR_QUERY: "bgR=255&bgG=255&bgB=255",

  constructor : function (args) {
    this.trace("init start.")
    this.initMisc(args);
    this.initBanners(args);
    this.initPanels(args);
    this.initMiis();
    this.putstime("initMiiFinish");
    this.initDisplay();
    this.initKeyScroll();
    this.putstime("init finish");
  },

  initMisc : function(args) {
    this.callback = args.clickHandler;
    this.selectedMiiIdx = -1;
    this.miiPanels = new Array();
    this.lastCursolPos = {x:0,y:0};
  },
  
  initBanners : function(args) {
    var dir = args.bannerDir;
    this.bannerDir = dir;
    this.img = {};

    this.img.miiBanner      = [];
    this.img.miiBanner[0]   = dirjoin(dir, args.miiBanner1Img);
    this.img.miiBanner[1]   = dirjoin(dir, args.miiBanner2Img);
    this.img.miiBanner[2]   = dirjoin(dir, args.miiBanner3Img);
    this.img.miiBanner[3]   = dirjoin(dir, args.miiBanner4Img);
    this.img.miiBanner[4]   = dirjoin(dir, args.miiBanner5Img);
    this.img.miiFocusMarkA  = dirjoin(dir, args.miiFocusMarkA);
    this.img.miiFocusMarkB  = dirjoin(dir, args.miiFocusMarkB);
  },
  
  initPanels : function(args) {
    /* get elements */
    this.basePanel = $(args.basePanel);
    this.miiContainer = $(args.miiContainer);
    this.selectedMiiFace = $(args.selectedMiiFace);
    if(!this.basePanel){ this.error("basePanel is not found.");}
    if(!this.miiContainer){ this.error("miiContainer is not found.");}
    if(!this.selectedMiiFace){ this.error("selectedMiiFace is not found.");}

    /* set event hundlers */
    this.basePanel.addEventListener('mousedown', bindTo(this.onMouseDown, this), false);

    /* for nickname popup */
    this.basePanel.addEventListener('mouseover', bindTo(this.onMouseOver, this), false);
    this.basePanel.addEventListener('mouseout', bindTo(this.onMouseOut, this), false);
    this.basePanel.addEventListener('mousemove', bindTo(this.onMouseMove, this), false);
    this.nicknamePanel = $('nicknamePanel');
    this.nicknameBox = $('nicknameBox');
    if(!this.nicknamePanel){ this.error("nicknamePanel is not found.");}
    if(!this.nicknameBox){ this.error("nicknameBox is not found.");}
  },
  
  collectMiiInfos : function () {
    var list = [];
    var i, idx, url_base, nickname;

    var wmii = new wiiMii();
    var miinum = wmii.getMiiNum();

    for(i=0,idx=0; i<miinum && idx < this.MAX_MII; idx++) {
      if( !wmii.isValidIcon(idx) ) continue;
      url_base = "miip://IDX/" + idx +".bmp";
      //url_base = "face" +idx+ ".png";
      nickname = wmii.getMiiName(idx);
      nickname = encodeHTML(nickname);
      var miiInfo =
      {
        idx          : idx,
        url          : url_base +"?"+ this.SIZE_QUERY +"&"+ this.COLOR_QUERY[i%5],
        selected_url : url_base +"?"+ this.SIZE_QUERY +"&"+ this.SELECTED_COLOR_QUERY,
        nickname     : nickname
      };

      list[i] = miiInfo;
      i++;
    }

    return list;
  },

  initMiis : function() {
    this.putstime("initMiis start");
    this.miiInfos = this.collectMiiInfos();
    var miiInfos = this.miiInfos;
    var miinum = miiInfos.length
    var i, miiPanel, name, userId, faceSrc;

    var panelHeight       = 70;
    var panelWidth        = 70;
    var paddingRight      = 14;
    var paddingBottom     = 22;
    var boxWidth          = panelWidth  + paddingRight;
    var boxHeight         = panelHeight + paddingBottom;
    var offsetX           = 8;
    var offsetY           = 17;
    var bottomSpaceHeight = 90;

    if (miinum <= 0) {
      document.getElementById("NoMii").style.display = '';
    }

    for(i=0; i<miinum; i++){
      faceSrc = miiInfos[i].url;
      this.trace("faceSrc : " + faceSrc);
      var row = Math.floor(i/5);
      var col = i%5;
      var miiBanner = this.img.miiBanner[col];
      this.trace("col : " +col+ " miiBanner : "+ miiBanner);

      miiPanel = document.createElement('div');
      this.miiContainer.appendChild(miiPanel);
      miiPanel.id = 'miiPanel'+i;
      miiPanel.className = 'miiPanel';
      miiPanel.innerHTML =
        '<img id="miiBanner'+i+'" class="miiBanner" src="'+miiBanner+'" '+
        '/>'+
        '<img id="miiFocusMark'+i+'" class="miiFocusMark" src="'+this.img.miiFocusMarkA+'" '+
        '/>'+
        '<img id="face'+i+'" class="face" src="'+ faceSrc +'" '+
        '/>'+
        '<div id="spacer"'+i+'" class="spacer" '+
          'onmouseover="MM_swapImage(\'miiFocusMark'+i+'\',\'\',\''+this.img.miiFocusMarkB+'\',0);wiiFocusSound();" '+
          'onmouseout="MM_swapImgRestore();" '+
        '></div>';
      miiPanel.index = i;
      miiPanel.miiInfo = miiInfos[i];
      miiPanel.faceSrc = faceSrc;
      MM_preloadImages(faceSrc);

      miiPanel.style.left = offsetX + (col * boxWidth)  + "px";
      miiPanel.style.top  = offsetY + (row * boxHeight) + "px";
      this.miiPanels.push(miiPanel);
    }
    var bottomSpaceer = document.createElement('div');
    this.miiContainer.appendChild(bottomSpaceer);
    bottomSpaceer.style.left = "0px";
    bottomSpaceer.style.top  = offsetY + ((row) * boxHeight) + bottomSpaceHeight + "px";
    bottomSpaceer.style.width   = "0px";
    bottomSpaceer.style.height  = "0px";
    bottomSpaceer.style.position  = 'absolute';
  },
  
  initDisplay : function() {
  this.hide();
  this.basePanel.focus();
  },

  initKeyScroll : function() {
    this.scrollStep = 30;
    document.body.addEventListener('keypress', bindTo(this.keyScroll, this), false);
  },

  keyScroll : function() {
    var _code = window.event.keyCode;
    var _obj = this.miiContainer;
    this.trace(this.pointerIsOnContainer)
    switch(_code) {
      case 175:    //up
      case  38:
        _obj.scrollTop -= this.scrollStep;
        var miiPanel = this.getMiiPanelUnderCursol();
        if( miiPanel )
          this.popupNicknamePanel(miiPanel);
        else
          this.nicknameBox.style.display = 'none';
        break;
      case 176:    //down
      case  40:
        _obj.scrollTop += this.scrollStep;
        var miiPanel = this.getMiiPanelUnderCursol();
        if( miiPanel )
          this.popupNicknamePanel(miiPanel);
        else
          this.nicknameBox.style.display = 'none';
        break;
    }
    this.trace(window.event.target.id);
  },

getMiiPanelUnderCursol :
  function() {
    var cursolPos = { x:this.lastCursolPos.x, y:this.lastCursolPos.y };
    var i,len=this.miiPanels.length;
    var containerLeft   = this.miiContainer.offsetLeft;
    var containerTop    = this.miiContainer.offsetTop;
    var containerWidth  = this.miiContainer.offsetWidth;
    var containerHeight = this.miiContainer.offsetHeight;
    var scrollOffsetX   = this.miiContainer.scrollLeft;
    var scrollOffsetY   = this.miiContainer.scrollTop;

    var crect =
    {
      x: containerLeft,
      y: containerTop,
      width: containerWidth,
      height: containerHeight
    }

    if( !this.isInRect(cursolPos, crect) ){
      return null;
    }

    for(i=0; i<len;i++){ /* needs optimize... */
      var mp = this.miiPanels[i];
      var mrect = 
      {
        x:      containerLeft + mp.offsetLeft - scrollOffsetX,
        y:      containerTop  + mp.offsetTop  - scrollOffsetY,
        width:  mp.offsetWidth,
        height: mp.offsetHeight
      };

      if( this.isInRect(cursolPos, mrect) ){
        return mp;
      }
    }
    return null;
  },

isInRect :
  function(pos, rect) {
    return ( pos.x >= rect.x && pos.x <= (rect.x + rect.width) &&
        pos.y >= rect.y && pos.y <= rect.y + rect.height);
  },

onMouseDown :
  function(event) {
    if( !event ) event = window.event;
    var target = event.target;
    if( target.className == 'spacer' ){
      wiiSelectSound();
      this.selectMii(target.parentNode.miiInfo);
      this.close();
    } else if( target.id == 'quitSpacer' ){
      wiiCancelSound();
      this.close();
    }
  },

selectMii :
  function(miiInfo) {
    this.selectedMiiIdx = miiInfo.idx;
    this.selectedMiiFace.src = miiInfo.selected_url;
    this.trace( "selected_url : " + miiInfo.selected_url );
    this.selectedMiiFace.style.display = '';
  },

popupNicknamePanel :
  function(miiPanel) {
    this.nicknamePanel.innerHTML = miiPanel.miiInfo.nickname;
    this.nicknameBox.style.display = '';

    if(!miiPanel.nicknameBasePosition){
      var centeringOffset = Math.floor( (this.nicknameBox.offsetWidth - miiPanel.offsetWidth) / 2);
      miiPanel.nicknameBasePosition = {};
      miiPanel.nicknameBasePosition.x = this.miiContainer.offsetLeft + miiPanel.offsetLeft - centeringOffset;
      miiPanel.nicknameBasePosition.y = this.miiContainer.offsetTop + miiPanel.offsetTop   - this.nicknameBox.offsetHeight - 5;
    }

    var scrollTop = this.miiContainer.scrollTop;
    var miiPanelTop = miiPanel.offsetTop;
    var frameoutOffset = scrollTop > miiPanelTop ? miiPanelTop : scrollTop;

    this.nicknameBox.style.top  = miiPanel.nicknameBasePosition.y - frameoutOffset + "px";
    this.nicknameBox.style.left = miiPanel.nicknameBasePosition.x + "px";
  },

onMouseOver :
  function(event) {
    if( !event ) event = window.event;
    var target = event.target;
    if( target.className == 'spacer' ){
      var miiPanel = target.parentNode;
      this.popupNicknamePanel(miiPanel);
    }
  },

onMouseOut :
  function(event) {
    if( !event ) event = window.event;
    var target = event.target;
    if( target.className == 'spacer' ){
      this.nicknameBox.style.display = 'none';
    }
  },

onMouseMove :
  function(event) {
    if( !event ) event = window.event;
    this.lastCursolPos.x = window.event.x;
    this.lastCursolPos.y = window.event.y;
  },

show :
  function() {
    this.basePanel.style.display = 'block';
  },

hide :
  function() {
    this.basePanel.style.display = 'none';
  },

open :
  function() {
    this.trace("miiselector opened.");
    this.show();
    MM_swapImgRestore(); // for selectedMiiBox
  },

close :
  function() {
    this.hide();
  },

error :
  function(msg) {
    this.trace("error : "+ msg);
  },

trace :
  function(msg) {
    trace("[MiiSelector] " + msg);
  },

putstime :
  function(label) {
    if( !this.starttime ) this.starttime = new Date();
    var header = label ? label+": " : "time: ";
    this.trace(header+ (new Date() - this.starttime));
  }
}
