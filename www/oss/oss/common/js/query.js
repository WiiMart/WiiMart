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

// Constructs a Querystring object that parses name/value pairs 
// from a query string
//
// Parameters: qs - Optional string to parse 
//                  If not specified, uses querystring from url.
// Example: Querystring qs = new Querystring();
//          var country = qs.get('country');    
function Querystring(qs) { 
    this.params = new Object();
    this.get=Querystring_get;
    
    if (qs == null) {
        qs=location.search.substring(1,location.search.length);
    }

    if (qs.length == 0) {
        return;
    }

    // Split on & to parse out name/value pairs
    var args = qs.split('&');
    
    // Loop over args and parse name=value
    for (var i=0;i<args.length;i++) {
        var value;
        var pair = args[i].split('=');
        var name = decodeURIComponent(pair[0]);

        if (pair.length == 2) {
            value = decodeURIComponent(pair[1]);
        } else {
            value = name;
        }
        this.params[name] = value;
    }
}

function Querystring_get(key, defaultValue) {
    var value=this.params[key];
    if (value==null) value=defaultValue;

    // Change undefined to null
    if (value == undefined) {
       value = null;
    }
    
    return value;
}
