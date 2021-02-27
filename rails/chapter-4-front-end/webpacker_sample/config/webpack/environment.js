const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')
const provide = require('./plugins/provide')

environment.loaders.prepend('erb', erb)
environment.loaders.prepend('provide', provide)
module.exports = environment
