# Pebble Bootstrap

A toolsetup to utilize grunt task in your pebble development

## Requirements:
Unstalled nodejs (http://nodejs.org/)
Installed grunt (http://gruntjs.com/getting-started)
Setup to run waf directly to compile pebble app

## Getting Started
* fork or copy repository to your workspace

* Edit package.json to contain your project name, git ...

* Install required packages with  `npm install`

* Run grunt bootstrap

You are ready to go:

## Features
* Multifile
  All javascript files are in 'src/js'. When building they are concatinated. Using browserify. Therefore you can use nodejs stile require calls.

* Minification
  For release targets javascript is going to be minified. So your pebble package stays small

* Unittests
  Support for jasmine unittests. See code for some examples in javascript and literate coffeescript
  
* Watch
  `grunt watch` lints, runs unit tests and builds whenever you change a file

* Debug
  `grunt debug` builds a debug build

* Release
  `grunt release` builds a release build (no logging)




