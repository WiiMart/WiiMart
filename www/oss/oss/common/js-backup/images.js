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

function MM_preloadImages() {
  //v3.0
  var d = document;
  if (d.images) {
      if (!d.MM_p)
          d.MM_p = new Array();
      var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
      for (i = 0; i < a.length; i++)
          if (a[i].indexOf("#") != 0) {
              d.MM_p[j] = new Image;
              d.MM_p[j++].src = a[i];
          }
  }
}

function MM_swapImgRestore() {
  //v3.0
  var i, x, a = document.MM_sr;
  for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
      x.src = x.oSrc;
}

function MM_findObj(n, d) {
  //v4.01
  var p, i, x;
  if (!d)
      d = document;
  if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
      d = parent.frames[n.substring(p + 1)].document;
      n = n.substring(0, p);
  }
  if (!(x = d[n]) && d.all)
      x = d.all[n];
  for (i = 0; !x && i < d.forms.length; i++)
      x = d.forms[i][n];
  for (i = 0; !x && d.layers && i < d.layers.length; i++)
      x = MM_findObj(n, d.layers[i].document);
  if (!x && d.getElementById)
      x = d.getElementById(n);
  return x;
}

function MM_swapImage() {
  //v3.0
  var i, j = 0, obj, args = MM_swapImage.arguments;
  document.MM_sr = new Array;
  for (i = 0; i < (args.length - 2); i += 3)
      if ((obj = MM_findObj(args[i])) != null) {
          document.MM_sr[j++] = obj;
          if (!obj.oSrc)
            obj.oSrc = obj.src;
          obj.src = args[i + 2];
      }
}

function MM_reloadPage(init) {
  //reloads the window if Nav4 resized
  if (init == true)
      with (navigator) {
          if ((appName == "Netscape") && (parseInt(appVersion) == 4)) {
              document.MM_pgW = innerWidth;
              document.MM_pgH = innerHeight;
              onresize = MM_reloadPage;
          }
      }
  else if (innerWidth != document.MM_pgW || innerHeight != document.MM_pgH)
      location.reload();
}

// Error Check
imagesCheck = true;
trace2("images.js loaded")
