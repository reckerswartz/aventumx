const path    = require("path")
const webpack = require("webpack")

module.exports = {
    entry: {
        application: "./app/javascript/application.js",
    },
    output: {
        filename: "[name].js",
        sourceMapFilename: "[name].js.map",
        path: path.resolve(__dirname, "app/assets/builds"),
    },
    plugins: [
        new webpack.optimize.LimitChunkCountPlugin({
            maxChunks: 1
        }),
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery',
            Popper: ['popper.js', 'default']
        }),
    ],
    module: {
        rules: [
            {
                test: /\.m?js/,
                resolve: {
                    fullySpecified: false,
                },
            },
            // Load fonts and images
            {
                test: /\.(woff|woff2|eot|ttf|otf|png|svg|jpg|jpeg|gif)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: "[name].[ext]",
                        }
                    }
                ]
            }
        ]
    },
    resolve: {
        extensions: ['.css', '.js', '.jsx', '.mjs', '.scss', '.png', '.jpg', '.jpeg', '.gif', '.svg'],
        alias: {
            '$': 'jquery/src/jquery',
            'jQuery': 'jquery/src/jquery',
            'jquery': 'jquery',
        },
    },
}