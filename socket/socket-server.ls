require! <[fs child_process]>
port = parseInt fs.read-file-sync \socket-port
io = require(\socket.io)(port)

io.on \connection (socket) ->
  socket.on 'start_process' (data) ->
    console.log data
    console.log \nanoha

console.log "socket server is running at port #port"
