var util = require('util')
var events = require('events')

function Pulsar(speed, times) {
    events.EventEmitter.call(this)
    var self = this
    this.speed = speed
    this.times = times
    this.on('newListener', function (eventName, listener) {
        if (eventName === 'pulse') {
            self.start()
        }
    })
}

util.inherits(Pulsar, events.EventEmitter)

Pulsar.prototype.start = function () {
    var self = this
    var id = setInterval(function () {
        self.emit('pulse')
        self.times--
        if (self.times === 0) {
            clearInterval(id)
        }
    }, this.speed)
}

Pulsar.prototype.stop = function () {
    if (this.listeners('pulse').length === 0) {
        throw new Error('No listeners have been added')
    }
}
var pulsar = new Pulsar(500, 5)

// add listener; if commented, an error will be throwed
pulsar.on('pulse', function () {
    console.log('.')
})

pulsar.stop()