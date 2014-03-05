module.exports = (grunt) ->

    # Package
    # =======

    pkg = require './package.json'

    # Configuration
    # =============
    grunt.initConfig

        # Package
        # -------
        pkg: pkg

        config:
            debug:
                options:
                    variables:
                        'phone': '192.168.1.3'
                        'logs': '--logs'
            release:
                options:
                    variables:
                        'phone': '192.168.1.3'
                        'logs': ''
                
      
        jasmine_node_lite:
            options:
                consoleReporter: 
                    enabled: true, 
                    stackTrace: false,
                    verbose: true
                junitReporter:
                    enabled: true,
                    savePath: './reports'
                jasmine:
                    specs: ['src/js/**/test/unit/*.spec.*']
            ci:
                options:
                    consoleReporter: 
                        enabled: true,
                        color: false, 
                        stackTrace: true,
                        verbose: true
                
            dev:
                options:
                    consoleReporter: 
                        enabled: true, 
                        stackTrace: true,
                        verbose: true
                    junitReporter:
                        enabled: false

        jshint:     
            all: ['src/js/**/*.js']
            options: 
                jshintrc: '.jshintrc'

        todos:
            default:
                src: ['src/**/*.js']
                options:
                    verbose: false
                    coloredOutput: true
                    priorities:
                        low: /(TODO)/
                        med: /(FIXME)/
                        high: /(REFACTOR|XXX)/
            
            build:
                src: ['src/**/*.js']
                options:
                    verbose: false
                    coloredOutput: false
                    priorities:
                        low: /(TODO)/
                        med: /(FIXME)/
                        high: /(REFACTOR|XXX)/

        watch:
            files: ['src/js/**/*.js','src/**/*.h','src/**/*.c']
            tasks: ['jshint','jasmine_node_lite:dev','browserify:debug','exec:debug','exec:build']
            options: 
                interrupt: false
            
        browserify:
            debug:
                src: ['src/js/**/*.js']
                dest: 'src/pebblejs/pebble-js-app.js'
            release:
                src: ['src/js/**/*.js']
                dest: 'temp/js/bundle/bundled.js'
                
        uglify:
            release:
                files: 'src/pebblejs/pebble-js-app.js': ['temp/js/bundle/bundled.js']
                options:
                    mangle: true

        exec:
            debug:
                cmd: 'waf configure -d'
            release:
                cmd: 'waf configure'
            build:
                cmd: 'waf'
            deploy:
                cmd: 'pebble install --phone <%= grunt.config.get("phone") %> <%= grunt.config.get("logs") %>'
                        
    # Modules
    # =======

    grunt.loadNpmTasks('grunt-jasmine-node-lite')
    grunt.loadNpmTasks('grunt-contrib-jshint')
    grunt.loadNpmTasks('grunt-todos')
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-browserify')
    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-exec')
    grunt.loadNpmTasks('grunt-config')


    # Tasks
    # =====

    grunt.registerTask('default', ['jshint',
        'jasmine_node_lite:dev', 'todos:default'])
    grunt.registerTask('test',['jasmine_node_lite:ci'])
    grunt.registerTask('ci',['jshint','jasmine_node_lite:ci',
        'todos:build','browserify:release','uglify:release',
        'exec:release','exec:build'])
    grunt.registerTask('debug',['config:debug','jshint','jasmine_node_lite:dev',
        'todos:build','browserify:debug',
        'exec:debug','exec:build','deploy'])
    grunt.registerTask('release',['config:release','ci','exec:deploy'])
