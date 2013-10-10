module.exports = (grunt) ->
  grunt.loadNpmTasks("grunt-contrib-clean")
  grunt.loadNpmTasks("grunt-contrib-compass")
  grunt.loadNpmTasks("grunt-contrib-connect")
  grunt.loadNpmTasks("grunt-contrib-jshint")
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.loadNpmTasks("grunt-rigger")

  grunt.registerTask("default", ["clean", "build", "compass", "connect", "watch"])

  grunt.registerTask("build", ["build:src", "build:spec"])
  grunt.registerTask("build:spec", ["clean:spec", "rig:spec", "jshint:spec"])
  grunt.registerTask("build:src", ["clean:src", "rig:src", "jshint:src"])

  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")

    clean:
      css: ["src/css/*"]
      spec: ["spec/js/*"]
      src: ["src/js/*"]

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
      spec: ["spec/js/jspecSuite-latest.js"]
      src: ["src/js/jspec-latest.js"]

    rig:
      spec:
        src: "spec/coffee/jspecSuite.coffee"
        dest: "spec/js/jspecSuite-latest.js"
      src:
        src: "src/coffee/jspec.coffee"
        dest: "src/js/jspec-latest.js"

    watch:
      coffee:
        files: [
          "spec/coffee/**/*.coffee"
          "src/coffee/**/*.coffee"
        ]
        tasks: ["rig", "jshint"]
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
