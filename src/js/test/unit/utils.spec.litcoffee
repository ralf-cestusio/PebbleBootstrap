Utils
=====
    describe 'Utils', ->

        utils = {}

        beforeEach () ->
            utils = require('../../utils')
            return

        afterEach () ->
            delete require.cache[require.resolve('../../utils')]

        describe 'isset', ->
            it 'Should be false if it is undefined', ->
                expect(utils.isset(undefined)).toBe(false)

            it 'Should be true if it is an object', ->
                expect(utils.isset({})).toBe(true)

        describe 'base64', ->
            it 'should be able to encode', ->
                orig = 'http://abc123.com/blah'
                expect(utils.base64Encode(orig)).toBe('aHR0cDovL2FiYzEyMy5jb20vYmxhaA==')
            it 'should be able to decode', ->
                orig = 'aHR0cDovL2FiYzEyMy5jb20vYmxhaA==';
                expect(utils.base64Decode(orig)).toBe('http://abc123.com/blah')
    