module.exports = (config, {gulp, iconfont, iconfontCss})->
  gulp.task 'iconfont', (cb)->
    gulp.src(config.iconfont.icons, buffer: false)
      .pipe(iconfontCss({
        fontName: config.iconfont.fontName
        path: 'scss'
        targetPath: config.iconfont.sassDest
        fontPath: config.iconfont.fontPath
      }))
      .pipe(iconfont({
        fontName: config.iconfont.fontName
        normalize: true
        fontHeight: 500
      }))
      .pipe(gulp.dest(config.iconfont.fontDest))
