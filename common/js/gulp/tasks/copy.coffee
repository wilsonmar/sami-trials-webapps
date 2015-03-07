module.exports = (config, {gulp}) ->
  gulp.task "copy", ->
    gulp.src('data/**')
      .pipe(gulp.dest("#{config.dest}/"))
    gulp.src('images/**')
      .pipe(gulp.dest("#{config.dest}/images/tools"))
    gulp.src('fonts/**')
      .pipe(gulp.dest("#{config.dest}/fonts"))
    gulp.src('js/vendor/**')
      .pipe(gulp.dest("#{config.dest}/javascripts/tools"))
