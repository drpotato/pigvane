module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        copy: {
            main: {
                files: [
                    {cwd: 'src/', expand: true, src: ['*.html'], dest: 'dev/'},
                    {cwd: 'src/res/public/', expand: true, src: ['*.json', '*.ttf', '*.otf'], dest: 'dev/res/'}
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
                    cwd: 'src/res/public/',
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

        docco: {
            main: {
                src: ['src/*.coffee'],
                options: {
                    output: 'docs/'
                }
            }
        },

        watch: {
            img: {
                files: ['src/res/**'],
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
    grunt.loadNpmTasks('grunt-docco');

    // Default task(s).
    grunt.registerTask('dev', ['watch:img', 'watch:js', 'watch:statics']);

};