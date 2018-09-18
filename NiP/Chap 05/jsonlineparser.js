var stream = require('stream')
var util = require('util')
var fs = require('fs')

function JSONLineReader(source) {
    stream.Readable.call(this)      // 1 通常确保调用父类的构造函数
    this._source = source
    this._foundLineEnd = false
    this._buffer = ''
    // 2 当数据源准备好可以触发之后的reads事件时调用read()
    source.on('readable', function () {
        this.read()
    }.bind(this))
}

// 3 从stream.Readable继承来创建一个可定制的新类
util.inherits(JSONLineReader, stream.Readable)

// 4 所有的定制stream.Readable类都必须实现_read()方法
JSONLineReader.prototype._read = function (size) {
    var chunk, line, lineIndex, result
    console.log(this)
    if (this._buffer.length === 0) {
        chunk = this._source.read() // 5 当类准备好接手更多数据时，在源上调用read()
        this._buffer += chunk
    }
    
    lineIndex = this._buffer.indexOf('\n')
    if (lineIndex !== -1) {
        // 6 从buffer的开始截取第一行来获取一些文本进行解析
        line = this._buffer.slice(0, lineIndex)
        if (line) {
            result = JSON.parse(line)
            this._buffer = this._buffer.slice(lineIndex + 1)
            // 7 无论何时当一个JSON记录解析出来时，出发一个“object”事件，
            //   对这个类来说是唯一的，但不是必需的
            this.emit('object', result)
            this.push(util.inspect(result))     // 8 把解析好的JSON发送回内部队列
        } else {
            this._buffer = this._buffer.slice(1)
        }
    }
}

var input = fs.createReadStream(__dirname + '/json-lines.txt', {
    encoding: 'utf8'
})
// 9 创建一个JSONLineReader的实例，传递一个文件流给它处理
var jsonLineReader = new JSONLineReader(input) 

jsonLineReader.on('object', function (obj) {
    console.log('pos:', obj.position, '- letter:', obj.letter)
})