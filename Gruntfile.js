module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        copy: {
            main: {
                files: [
                    {cwd: 'src/', expand: true, src: ['*.html', '*.json'], dest: 'dev/'},
                    {cwd: 'src/res/public/noupscale', expand: true, src: ['**'], dest: 'dev/res/'},
                    {cwd: 'src/res/public/2x', expand: true, src: ['**.json'], dest: 'dev/res/'},
                    {cwd: 'src/res/public/4x', expand: true, src: ['**.json'], dest: 'dev/res/'},
                    {cwd: 'src/res/public/sounds', expand: true, src: ['**'], dest: 'dev/res/'},
                    {cwd: 'src/res/public/tilemap', expand: true, src: ['*-2x.*','*.json'], dest: 'dev/res'}
                    
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
            twotimes: {
                options: {
                    sizes: [{
                        name: '2x',
                        width: '200%',
                        height: '200%',
                        filter: 'Point'
                    }]
                },

                files: [{
                    expand: true,
                    src: ['**/**.png'],
                    cwd: 'src/res/public/2x',
                    dest: 'dev/res/'
                },
                {
                    expand: true,
                    src: ['res/public/tilemap/*.png'],
                    filter: function (src) {
                        if (src.indexOf('2x') === -1) {
                            return true;
                        } else {
                            return false;
                        }
                    },
                    cwd: 'src/',
                    dest: 'src/'
                }
                ]
            },
            fourtimes: {
                options: {
                    sizes: [{
                        name: '4x',
                        width: '400%',
                        height: '400%',
                        filter: 'Point'  
                    }]
                },

                files: [{
                    expand: true,
                    src: ['**/**.png'],
                    cwd: 'src/res/public/4x',
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
            twotimes: {
                files: ['src/res/public/2x/**', 'src/res/public/tilemap/**'],
                tasks: ['responsive_images:twotimes'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            },
            fourtimes: {
                files: ['src/res/public/4x/**'],
                tasks: ['responsive_images:fourtimes'],
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
                files: ['src/res/public/**', 'src/*.html', 'src/*.json', 'src/res/public/tilemap/**'],
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