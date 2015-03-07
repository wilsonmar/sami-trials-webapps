require('coffee-react/register');

var config = {
  iconfont: {
    icons: ['icons/*.svg'],
    fontName: 'Icons',
    fontPath: '/assets/fonts/',
    sassDest: '../styles/lib/_icons.scss',
    fontDest: 'fonts/'
  },
  sass: [ "styles/trials.scss" ],
  browserify: {
    sourcePath: './js/app',
    buildPath: './public/javascripts/tools',
    fileName: 'app.js'
  },
  dest: './public'
};

var tasks = [
  'default',
  'browserify',
  'iconfont',
  'css',
  'copy',
  'watch',
  'clean'];

var gulp = require('gulp');

var sharedDependencies = {
  gulp: gulp,
  runSequence: require('run-sequence').use(gulp),
  livereload: require('gulp-livereload'),
  browserify: require('browserify'),
  watchify: require('watchify'),
  source: require('vinyl-source-stream'),
  reactify: require('coffee-reactify'),
  streamify: require('gulp-streamify'),
  uglify: require('gulp-uglify'),
  sass: require('gulp-ruby-sass'),
  iconfont: require('gulp-iconfont'),
  iconfontCss: require('gulp-iconfont-css'),
  del: require('del')
};

tasks.forEach(function(task){
  require('./common-js/gulp/tasks/' + task)(config, sharedDependencies);
});
