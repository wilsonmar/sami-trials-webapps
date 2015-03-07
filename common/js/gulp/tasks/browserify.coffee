module.exports = (config, {gulp, livereload, browserify, watchify, source, reactify, streamify, uglify}) ->
  exitOnError = true
  handleError = (err) ->
    console.log("#{exitOnError} #{err}")
    if exitOnError
      process.exit(1)
    else
      @emit("end")

  bundle = (bundler, config, watch) ->
    b = bundler.bundle()
      .on("error", handleError)
      .pipe(source(config.fileName))

    (if watch
      b.pipe(livereload())
    else
      b.pipe(streamify(uglify()))
    ).pipe(gulp.dest(config.buildPath))


  bundler = (config, watch=false) ->
    b = browserify(
      config.sourcePath,
      cache: {}, packageCache: {}, fullPaths: true,
      extensions: ['.coffee'],
      debug: watch
    )

    b.transform(reactify)

    if watch
      b = watchify(b)
      b
        .on("error", handleError)
        .on 'update', ()-> bundle(b, config, true)

    bundle(b, config, watch)

  gulp.task 'watchify', (callback) ->
    exitOnError = false
    bundler(config.browserify, true)
    callback()

  gulp.task 'browserify', (callback) ->
    bundler(config.browserify)
    callback()
