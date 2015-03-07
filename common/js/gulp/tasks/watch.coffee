module.exports = (config, {gulp, runSequence, livereload})->
  gulp.task "watch", ['watchify'], (callback)->
    livereload.listen()

    gulp.watch("icons/**/*")
      .on "change", -> runSequence('iconfont', 'copy', 'css')
    gulp.watch "styles/**/*", ["css"]
    gulp.watch ['images/**', 'fonts/**'], ["copy"]
    gulp.watch("./public/stylesheets/**/*.css")
      .on "change", livereload.changed

    callback()
