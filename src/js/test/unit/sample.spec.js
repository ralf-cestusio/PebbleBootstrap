'use strict';

describe( 'utils', function() {

  var utils = {};

  beforeEach( function() {
    utils = require( '../../utils' );
  } );

  afterEach( function() {
    delete require.cache[ require.resolve( '../../utils' ) ];
  } );

  describe( 'isset', function() {
    it( 'Should be false if it is undefined', function() {
      expect( utils.isset( undefined ) ).toBe( false );
    } );
  } );
} );