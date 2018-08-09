var EventEmitter = require('events').EventEmitter
var fs = require('fs')
var content

function readFileRequired(cb) {
    if (!content) {
        fs.readFile(__filename, 'utf8', function (err, data) {
            content = data
            console.log('readFileRequired: readFile')
            cb(err, content)
        })
    } else {
        process.nextTick(function () {
            console.log('readFileRequired: cached')
            cb(null, content)
        })
    }
}

readFileRequired(function (err, data) {
    console.log('1. Length:', data.length)
    readFileRequired(function (err, data2) {
        console.log('2. Length:', data2.length)
    })
    console.log('Reading file again...')
})