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
NJSL.FriendSelector = function (args) { this.constructor(args); };

NJSL.FriendSelector.prototype = { 

constructor :
  function (args) {
    this.trace("init start.");
    this.initMisc(args);
    this.initBanners(args);
    this.initPanels(args);
    this.initFriends();
    this.initDisplay();
    this.initKeyScroll();
    this.trace("init complete.");
  },

initMisc :
  function(args) {
    this.callback = args.clickHandler;
    this.nwc24Check();
  },

initBanners :
  function(args) {
    var dir = args.bannerDir;
    this.bannerDir = dir;
    this.img = {};
    this.img.friendBannerA = dirjoin( dir, args.friendBannerA);
    this.img.friendBannerB = dirjoin( dir, args.friendBannerB);
  },

initPanels :
  function(args) {
    /* get elements */
    this.basePanel = $(args.basePanel);
    this.friendContainer = $(args.friendContainer);
    if(!this.basePanel){ this.error("basePanel is not found.");}
    if(!this.friendContainer){ this.error("friendContainer is not found.");}

    /* set event hundlers */
    this.basePanel.addEventListener('mousedown', bindTo(this.onMouseDown, this), false);
  },

initFriends :
  function() {
    this.flist = new wiiNwc24();

    var i, friendPanel, name, userId, faceSrc;
    var flist = this.flist;
    var panellHeight = "68";
    var panelWidth = "244";

    if (this.flist.getFriendNum() <= 0) {
      friendPanel = document.createElement('div');
      this.friendContainer.appendChild(friendPanel);
      friendPanel.id = 'friendPanel'+'0';
      friendPanel.className = 'friendPanel';
      friendPanel.style.height = "240px";
      friendPanel.style.width = "480px";
      friendPanel.align = "center";
      friendPanel.innerHTML = '<table width="400px" height="100%"><tr><td align="center" valign="middle"><span id="noWiiFriend" class="contentsBlackM"></span></td></tr></table>';
    }

    for(i=0; i<this.flist.getFriendNum(); i++){
      name = flist.getFriendInfo(i, "name");
      name = encodeHTML(name);
      userId = flist.getFriendInfo(i, "userId");
      miiCId = flist.getFriendInfo(i, "miiImage");
      friendPanel = document.createElement('div');
      this.friendContainer.appendChild(friendPanel);
      friendPanel.id = 'friendPanel'+i;
      friendPanel.className = 'friendPanel';
      faceSrc="miip://CID/" + miiCId + ".bmp?width=48&height=48" + "&bgR=159&bgG=224&bgB=246";
      friendPanel.innerHTML =
        '<img id="friendBanner'+i+'" class="friendBanner" src="'+this.img.friendBannerA+'" '+
        '/>'+
        '<img id="face'+i+'" class="face" src="'+ faceSrc +'" />'+
        '<div id="nickname"'+i+'" class="nickname" style="width:155px; overflow:hidden;">'+name+'</div>'+
        '<div id="spacer"'+i+'" class="spacer" '+
          'onmouseover="MM_swapImage(\'friendBanner'+i+'\',\'\',\''+this.img.friendBannerB+'\',0);wiiFocusSound();" '+
          'onmouseout="MM_swapImgRestore();" '+
        '></div>';
      friendPanel.nickname = name;
      friendPanel.userId = userId;
      friendPanel.index = i;
      friendPanel.style.top = (Math.floor(i/2) * panellHeight) + "px";
      if( i%2 == 0){
        friendPanel.style.left = "1px";
      }else{
        friendPanel.style.left = panelWidth + "px";
      }
    }
  },

initDisplay :
  function() {
  this.show();
  this.basePanel.focus();
  },

initKeyScroll :
  function() {
    this.scrollStep = 30;
    document.body.addEventListener('keypress', bindTo(this.keyScroll, this), false);
  },

keyScroll :
  function() {
    var _code = window.event.keyCode;
    var _obj = this.basePanel;
    switch(_code)
    {
      case 175:    //up
      case  38:
        _obj.scrollTop -= this.scrollStep;
        break;
      case 176:    //down
      case  40:
        _obj.scrollTop += this.scrollStep;
        break;
    }
  },

onMouseDown :
  function() {
    var target = window.event.target;
    switch(target.className){
      case 'spacer' :
        if( this.callback ){
          this.callback(target.parentNode.index);
        }
        break;

      default : return;
    }
  },

show :
  function() {
    this.basePanel.style.display = '';
  },

hide :
  function() {
    this.basePanel.style.display = 'none';
  },

error :
  function(msg) {
    this.trace("error : "+ msg);
  },

nwc24Check :
  function() {
    this.trace("nwc24Check");
    var nwc24 = new wiiNwc24();
    if( !nwc24.sendable ){
      var shop = new wiiShop();
      shop.error( nwc24.mailErrNo, 2 );
    }
  },
  
trace :
  function(msg) {
    trace("[FriendSelector] " + msg);
  }
}
