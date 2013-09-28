module.exports = (grunt) ->
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-contrib-watch")

  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")

    coffee:
      compile:
        expand: true
        cwd: "src/coffee/"
        src: ["**/*.coffee"]
        dest: "src/js/"
        ext: ".js"

    watch:
      scripts:
        files: ["src/coffee/**/*.coffee"]
        tasks: ["coffee"]
        options:
          spawn: false
  )
