const path = require('path');
const ProgressBarPlugin = require('progress-bar-webpack-plugin');
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const WebpackAutoInject = require('webpack-auto-inject-version');

const Components = require('../components.json');
const config = require('./config');

const webpackConfig = {
  mode: 'production',
  entry: Components,
  output: {
    path: path.resolve(process.cwd(), './lib'),
    publicPath: '/dist/',
    filename: '[name].js',
    chunkFilename: '[id].js',
    libraryTarget: 'commonjs2'
  },
  resolve: {
    extensions: ['.js', '.vue', '.json'],
    alias: config.alias,
    modules: ['node_modules']
  },
  externals: config.externals,
  performance: {
    hints: false
  },
  stats: 'none',
  optimization: {
    minimize: false
  },
  module: {
    rules: [
      {
        test: /\.(jsx?|babel|es6)$/,
        include: process.cwd(),
        exclude: config.jsexclude,
        loader: 'babel-loader'
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          compilerOptions: {
            preserveWhitespace: false
          }
        }
      },
      {
        test: /\.css$/,
        loaders: ['style-loader', 'css-loader']
      },
      {
        test: /\.(svg|otf|ttf|woff2?|eot|gif|png|jpe?g)(\?\S*)?$/,
        loader: 'url-loader',
        query: {
          limit: 10000,
          name: path.posix.join('static', '[name].[hash:7].[ext]')
        }
      }
    ]
  },
  plugins: [
    new ProgressBarPlugin(),
    new VueLoaderPlugin(),
    new WebpackAutoInject({
      SHORT: 'CUSTOM',
      SILENT: false,
      PACKAGE_JSON_PATH: './package.json',
      PACKAGE_JSON_INDENT: 4,
      components: {
        AutoIncreaseVersion: false,
        InjectAsComment: true,
        InjectByTag: true
      },
      componentsOptions: {
        AutoIncreaseVersion: {
          runInWatchMode: false
        },
        InjectAsComment: {
          tag: 'Vui-pc Version: {version} - {date}',
          multiLineCommentType: true // use `/** */` instead of `//` as comment block
        }
      },
      LOGS_TEXT: {
        AIS_START: 'add version started'
      }
    })
  ]
};

module.exports = webpackConfig;
