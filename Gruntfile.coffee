module.exports = (grunt) ->
  grunt.loadNpmTasks("grunt-contrib-clean")
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-coffeelint")
  grunt.loadNpmTasks("grunt-contrib-watch")

  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")

    clean:
      src: ["src/js/*"]

    coffee:
      compile:
        expand: true
        cwd: "src/coffee/"
        src: ["**/*.coffee"]
        dest: "src/js/"
        ext: ".js"

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
      src: ["src/coffee/**/*.coffee"]

    watch:
      scripts:
        files: ["src/coffee/**/*.coffee"]
        tasks: ["coffeelint", "coffee"]
        options:
          spawn: false
  )
