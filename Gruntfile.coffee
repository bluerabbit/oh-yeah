module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib'
  grunt.loadNpmTasks 'grunt-bower-task'

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    clean:
      build: ['js']

    coffee:
      glob_to_multiple:
        expand: true
        cwd: 'coffee'
        src: ['**/*.coffee']
        dest: 'js'
        ext: '.js'
      options:
        bare: true

    watch:
      coffee:
        files: ['coffee/**/*.coffee']
        tasks: ['clean', 'coffee']

    bower:
      install:
        options:
          targetDir: './lib'
          layout:    'byType'
          install:   true
          verbose:   false
          cleanTargetDir: true
          cleanBowerDir: false

  grunt.registerTask 'default', ['clean', 'coffee']
