# modules
window.$ = window.jQuery = require 'jquery/dist/jquery.min.js'
require! \script-loader!socket.io-client/dist/socket.io.js
require 'semantic-ui-css/semantic.min.js'
require 'semantic-ui-css/semantic.min.css'

# our code
require './main.styl'

# our js code
$ document .ready ->
  $ \.button.start_process .click ->
    $.get \./start_process ->
      pid = it.pid
      window.socket = socket = io.connect \:8714
        .on \connect ->
          socket.emit \listen_process {pid}
          console.log \nanoha
        .on \history-log (data) -> console.log data
        .on \log (data) -> console.log data

# vi:et:nowrap:sw=2:ts=2
