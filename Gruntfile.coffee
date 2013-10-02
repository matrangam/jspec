module.exports = (grunt) ->
  grunt.loadNpmTasks("grunt-coffeelint")
  grunt.loadNpmTasks("grunt-contrib-clean")
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-contrib-compass")
  grunt.loadNpmTasks("grunt-contrib-connect")
  grunt.loadNpmTasks("grunt-contrib-jshint")
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.loadNpmTasks("grunt-rigger")

  grunt.registerTask("default", ["clean", "coffeelint", "rig", "coffee", "jshint", "compass", "connect", "watch"])

  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")

    clean:
      spec: ["spec/js/*"]
      css: ["src/css/*"]
      src: ["src/js/*"]

    coffee:
      spec:
        files:
          "spec/js/jspecSuite-latest.js": "spec/coffee/jspecSuite-latest.coffee"

      src:
        files:
          "src/js/jspec-latest.js": "src/coffee/jspec-latest.coffee"

    coffeelint:
      options:
        arrow_spacing:
          level: "error"
        camel_case_classes:
          level: "error"
        coffeescript_error:
          level: "error"
        indentation:
          level: "error"
        max_line_length:
          level: "ignore"
        no_backticks:
          level: "error"
        no_empty_param_list:
          level: "ignore"
        no_implicit_braces:
          level: "ignore"
        no_implicit_parens:
          level: "error"
        no_plusplus:
          level: "ignore"
        no_stand_alone_at:
          level: "ignore"
        no_tabs:
          level: "error"
        no_throwing_strings:
          level: "error"
        no_trailing_semicolons:
          level: "error"
        no_trailing_whitespace:
          level: "warn"
      spec: ["spec/coffee/**/*.coffee"]
      src: ["src/coffee/**/*.coffee"]

    compass:
      options:
        config: ".compass.rb"
      dev:
        options:
          sassDir: "src/scss/"
          cssDir: "src/css/"

    connect:
      server:
        options:
          port: 9001,
          base: [
            "server/"
            "spec/js/"
            "src/css/"
            "src/js/"
          ]

    jshint:
      options:
        "-W004": true # <class name> is already defined.
        "-W041": true # Use '===' to compare with 'null'.
      spec: ["spec/js/**/*.js"]
      src: ["src/js/**/*.js"]

    rig:
      spec:
        src: "spec/coffee/jspecSuite.coffee"
        dest: "spec/coffee/jspecSuite-latest.coffee"
      src:
        src: "src/coffee/jspec.coffee"
        dest: "src/coffee/jspec-latest.coffee"

    watch:
      coffee:
        files: [
          "spec/coffee/**/*.coffee"
          "src/coffee/**/*.coffee"
        ]
        tasks: ["coffeelint", "rig", "coffee", "jshint"]
        options:
          spawn: false

      js:
        files: [
          "spec/js/**/*.js"
          "src/js/**/*.js"
        ]
        tasks: ["jshint"]
        options:
          spawn: false

      scss:
        files: [
          "src/scss/**/*.scss"
        ]
        tasks: ["compass"]
        options:
          spawn: false
  )
