module.exports = (config, {gulp, sass})->
  gulp.task 'css', (callback) ->
    gulp.src(config.sass)
      .pipe(sass())
      .pipe(gulp.dest("#{config.dest}/stylesheets/tools"))
