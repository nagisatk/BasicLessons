var fs = require('fs')

fs.readFile('./name.txt', function (err, buf) {
    console.log(buf.toString('ascii'))
})

var user = 'johnny'
var pass = 'c-bad'

var encoded = Buffer(user + ':' + pass).toString('base64')
console.log(encoded)

// === read image

var mime = 'image/png'
var encoding = 'base64'
var data = fs.readFileSync('./shisho.png').toString(encoding)
var uri = 'data:' + mime + ';' + encoding + ',' + data
// console.log(uri)

// decode

data = uri.split(',')[1]

buf = Buffer(data, 'base64')

fs.writeFileSync('./shisho2.png', buf)

// handle binary data
fs.readFile('./world.dbf', function (err, buf) {
    var header = {}

    var date = new Date()
    date.setUTCFullYear(1900 + buf[1])
    date.setUTCMonth(buf[2])
    date.setUTCDate(buf[3])
    header.lastUpdated = date.toUTCString()     // Sat, 26 Aug 1995

    header.totalRecords = buf.readUInt32LE(4)   // 246
    header.bytesInHeader = buf.readUInt16LE(8)  // 385
    header.bytesInRecord = buf.readUInt16LE(10) // 424

    var fields = []
    var fieldOffset = 32
    var fieldTerminator = 0x0D

    var FIELD_TYPES = {
        C: 'Character',
        N: 'Numeric'
    }

    while (buf[fieldOffset] != fieldTerminator) {
        var fieldBuf = buf.slice(fieldOffset, fieldOffset + 32)

        // decode
        var field = {}
        field.name = fieldBuf.toString('ascii', 0, 11).replace(/\u0000/g, '')
        field.type = FIELD_TYPES[fieldBuf.toString('ascii', 11, 12)]
        field.length = fieldBuf[16]

        fields.push(field)
        fieldOffset += 32
    }

    var startingRecordOffset = header.bytesInHeader
    var records = []

    for (var i = 0; i < header.totalRecords; i++) {
        var recordOffset = startingRecordOffset + (i * header.bytesInRecord)
        var record = {}

        record._isDel = buf.readUInt8(recordOffset) === 0x2A
        recordOffset++

        for (var j = 0; j < fields.length; j++) {
            field = fields[j]
            var Type = field.type === 'Numeric' ? Number : String
            record[field.name] = Type(buf.toString('utf8', recordOffset,
                                        recordOffset + field.length).trim())
            recordOffset += field.length
        }
        records.push(record)
    }
    fs.writeFile('world.json',
        JSON.stringify({
            header: header,
            fields: fields,
            records: records
        }), function (err) {
            if (err) console.log(err)
    })
})