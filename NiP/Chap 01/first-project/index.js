var CountStream = require('./CountStream')
var countStream = new CountStream('book')
var http = require('https')

http.get('https://www.manning.com/', function (res) {
    console.log(res)
    res.pipe(countStream)
})

countStream.on('total', function (count) {
    console.log('Total matches: ', count)
})