const path    = require("path")
const { merge } = require('webpack-merge');
const commonConfig = require('./webpack.config.common')

module.exports = merge(commonConfig, {
    mode: 'development',
    devtool: 'inline-source-map',
    devServer: {
        compress: false,
        port: 3032,
        hot: true,
        client: {
            webSocketTransport: 'ws',
        },
        webSocketServer: 'ws',
        historyApiFallback: false,
        // serve files from disk
        devMiddleware: {
            writeToDisk: true
        },
    },
})