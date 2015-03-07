module.exports = (config, {gulp, del})->
  gulp.task "clean", (callback)->
    del ['styles/lib/_icons.scss'], callback
