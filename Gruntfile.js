module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        copy: {
            main: {
                files: [
                    {cwd: 'src/', expand: true, src: ['*.html'], dest: 'dev/'},
                    {cwd: 'src/res/public/noupscale', expand: true, src: ['**'], dest: 'dev/res/'},
                    {cwd: 'src/res/public/upscale', expand: true, src: ['**.json'], dest: 'dev/res/'},
                    {cwd: 'src/res/public/sounds', expand: true, src: ['**'], dest: 'dev/res/'}
                    
                ],
                nonull: true
            },
            js: {
                files: [
                    {cwd: 'src/', expand: true, src: ['*.js'], dest: 'dev/'},
                ],
                nonull: true  
            }
        },

        responsive_images: {
            main: {
                options: {
                    sizes: [{
                        name: 'large',
                        width: '200%',
                        height: '200%',
                        filter: 'Point'
                    }]
                },

                files: [{
                    expand: true,
                    src: ['**.png'],
                    cwd: 'src/res/public/upscale',
                    dest: 'dev/res/'
                }]
            }
        },

        coffee: {
            main: {
                files: {
                    'dev/app.js': ['src/*.coffee']
                }
            }
        },
        watch: {
            img: {
                files: ['src/res/public/upscale/**'],
                tasks: ['responsive_images:main'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            },
            coffee: {
                files: ['src/*.coffee'],
                tasks: ['coffee:main'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            },
            js: {
                files: ['src/*.js'],
                tasks: ['copy:js'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            },
            statics: {
                files: ['src/res/public/**', 'src/*.html'],
                tasks: ['copy:main'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            }
        }
    });

    // Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-responsive-images');
    grunt.loadNpmTasks('grunt-contrib-coffee');

    // Default task(s).
    grunt.registerTask('dev', ['watch:img', 'watch:js', 'watch:statics']);

};