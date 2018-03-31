require! <[fs child_process]>
port = parseInt fs.read-file-sync \socket-port
io = require(\socket.io)(port)
dl-process = {}

function getUserHome
  return process.env[if process.platform is \win32 then \USERPROFILE else \HOME]

io.on \connection (socket) ->
  socket.on 'start_process' (job) !->
    return if not job
    pid = job.pid
    log = -> io.to pid .emit \log it.to-string!
    run = (command, arg, option, next) ->
      log-stream = fs.create-write-stream "./tmp/#pid.log" flags: \a
      dl-process[pid] = p = child_process.spawn command, arg, option
      p.stdout.on \data, log .pipe log-stream
      p.stderr.on \data, log .pipe log-stream
      p.on \close (code) -> if code isnt 1 then next!
    run './node_modules/.bin/lsc' ['random.ls'], {}, ->
      console.log \fate
      run "#{getUserHome!}/.virtualenvs/log-sync/bin/python" ['./manage.py', 'dl_finish', pid], {}, ->
        console.log pid, \nanoha
  socket.on 'listen_process' (job) !->
    return if not job
    pid = job.pid
    if dl-process[pid]
      @join pid
      fs.read-file "./tmp/#pid.log" {encoding: \utf8} (err, data) ->
        throw err if err
        socket.emit \history-log data

console.log "socket server is running at port #port"
