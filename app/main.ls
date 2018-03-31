# modules
window.$ = window.jQuery = require 'jquery/dist/jquery.min.js'
require \script-loader!socket.io-client/dist/socket.io.js
require \script-loader!console-log-div
require \semantic-ui-css/semantic.min.js
require \semantic-ui-css/semantic.min.css

# our code
require './main.styl'

function connect-socket pid
  window.socket = socket = io.connect \:8714
    .on \connect -> socket.emit \listen_process {pid}
    .on \history-log (data) -> console.log pid, data
    .on \log (data) -> console.log pid, data

# our js code
$ document .ready ->
  $.get \./processing_processes ->
    for pid in it.data => connect-socket pid
  $ \.button.start_process .click ->
    $.get \./start_process -> connect-socket it.pid

# vi:et:nowrap:sw=2:ts=2
