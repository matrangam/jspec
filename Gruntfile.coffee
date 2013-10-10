module.exports = (grunt) ->
  jspecLatestFile = "jspec-latest.js"
  jspecSuiteLatestFile = "jspecSuite-latest.js"

  grunt.loadNpmTasks("grunt-contrib-clean")
  grunt.loadNpmTasks("grunt-contrib-compass")
  grunt.loadNpmTasks("grunt-contrib-connect")
  grunt.loadNpmTasks("grunt-contrib-jshint")
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.loadNpmTasks("grunt-rigger")
  grunt.loadNpmTasks("grunt-shell")

  grunt.registerTask("default", ["clean", "build", "compass", "connect", "watch"])

  grunt.registerTask("build", ["build:src", "build:spec"])
  grunt.registerTask("build:spec", ["clean:spec", "rig:spec", "jshint:spec"])
  grunt.registerTask("build:src", ["clean:src", "rig:src", "jshint:src"])

  grunt.registerTask("spec", ["shell:spec"])

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
        "-W088": true # Creating global 'for' variable. Should be 'for (var id ...'.
      spec: ["spec/js/#{jspecSuiteLatestFile}"]
      src: ["src/js/#{jspecLatestFile}"]

    rig:
      spec:
        src: "spec/coffee/jspecSuite.coffee"
        dest: "spec/js/#{jspecSuiteLatestFile}"
      src:
        src: "src/coffee/jspec.coffee"
        dest: "src/js/#{jspecLatestFile}"

    shell:
      spec:
        options:
          stderr: true
          stdout: true
        command: "bin/jspec"

    watch:
      spec:
        files: [
          "spec/coffee/**/*.coffee"
        ]
        tasks: ["rig:spec", "jshint:spec"]
        options:
          spawn: false

      src:
        files: [
          "src/coffee/**/*.coffee"
        ]
        tasks: ["rig:src", "jshint:src"]
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
