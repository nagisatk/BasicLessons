var http = require('http')
var fs = require('fs')
var zlib = require('zlib')

http.createServer(function (req, res) {
    res.writeHead(200, { 'content-encoding': 'gzip' })
    fs.createReadStream(__dirname + '/index.html')
        .pipe(zlib.createGzip())
        .pipe(res)
}).listen(8000)