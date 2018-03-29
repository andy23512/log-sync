require! <[extract-text-webpack-plugin nib webpack webpack-bundle-tracker]>

module.exports =
  context: __dirname,
  entry:
    main: <[./app/main.ls]>
  module:
    rules: # https://webpack.js.org/configuration/module/#module-rules
      * test: /\.(jade|pug)$/ use: \pug-loader
      * test: /\.ls$/ use: \livescript-loader
      * test: /\.styl$/ loader: extract-text-webpack-plugin.extract fallback-loader: \style-loader loader: <[css-loader stylus-loader]>
      * test: /\.css$/ loader: extract-text-webpack-plugin.extract fallback-loader: \style-loader  loader: \css-loader
      * test: /\.(eot|ico|jpg|mp3|svg|ttf|woff2|woff|png?)($|\?)/ loader: \file-loader
  output:
    filename: '[name].js'
    path: __dirname + \/dist
    public-path: \/dist/
  plugins: # Additional plugins. ref: https://webpack.js.org/plugins/
    * new webpack.NoEmitOnErrorsPlugin!
    * new extract-text-webpack-plugin filename: '[name].css' all-chunks: true # ref: https://webpack.js.org/guides/code-splitting-css/#using-extract-text-webpack-plugin-extracttextplugin
    * new webpack-bundle-tracker filename: \./webpack-stats.json
    * new webpack.LoaderOptionsPlugin do # stylus loader config. ref: https://github.com/shama/stylus-loader
        test: /\.styl$/
        stylus: default: import: <[~nib/lib/nib/index.styl]>, use: [nib!]

# vi:et:sw=2:sts=2
