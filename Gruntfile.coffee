module.exports = (grunt) ->
  grunt.loadNpmTasks("grunt-contrib-coffee")

  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")

    coffee:
      compile:
        expand: true
        cwd: "src/coffee/"
        src: ["**/*.coffee"]
        dest: "src/js/"
        ext: ".js"
  )
