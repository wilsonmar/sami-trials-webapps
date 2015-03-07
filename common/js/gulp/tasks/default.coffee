module.exports = (config, {gulp, runSequence}) ->
  gulp.task 'default', (cb)->
    runSequence(
      'clean',
      'iconfont',
      'browserify', 
      'css',
      'copy',
      cb
    )
