const { environment } = require('@rails/webpacker')

module.exports = environment

/*Bootstrapの導入　カリキュラム24章参照*/
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)