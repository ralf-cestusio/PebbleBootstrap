/**
 *  This file is subject to the terms and conditions defined in the file
 *  'LICENCE.md', which is part of this source code package.
 *  @author Ralf Mueller
 */

'use strict';
var utils = require( './utils' );

// --------------------------------------------------

Pebble.addEventListener( 'ready', function() {
  utils.log.info( 'ready received' );
} );

// --------------------------------------------------

Pebble.addEventListener( 'appmessage', function( e ) {
  utils.log.debug( e.type );
  utils.log.debug( JSON.stringify( e.payload ) );
} );