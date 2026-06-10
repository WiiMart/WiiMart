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
var NJSL = window.NJSL || {};
var $ = function (e) { return document.getElementById(e); }
var dirjoin = function (d, f) { return d != '' ? d + "/" + f : f; };
//var valstr = function(str) { return str +" : "+ eval(str); };

var bindTo = function () {
  var func = arguments[0];
  var obj = arguments[1];
  var args = new Array();
  var length = arguments.length;

  for (var i = 2; i < length; i++) { args.push(arguments[i]); }

  return function () {
    return func.apply(obj, args);
  };
};
trace2("njsl.js loaded")
