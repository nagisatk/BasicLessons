var util = require('util')
var events = require('events')

// function MusicPlayer() {
//     events.EventEmitter.call(this)
// }

// util.inherits(MusicPlayer, events.EventEmitter)

var AudioDevice = {
    play: function (track) {
        // Stub: Trigger playback through iTunes, mpg123, etc.
        console.log('AudioDevice starts on ' + track + '...')
    },

    stop: function () {
        console.log('AudioDevice stops...')
    }
}


function MusicPlayer() {
    this.playing = false
    events.EventEmitter.call(this)
}

util.inherits(MusicPlayer, events.EventEmitter)

var musicPlayer = new MusicPlayer()

musicPlayer.on('play', function (track) {
    this.playing = true
    AudioDevice.play(track)
})

musicPlayer.on('stop', function () {
    this.playing = false
    AudioDevice.stop()
})

function tracking(track) {
    console.log('Track now playing...........')
}

musicPlayer.on('play', tracking)

musicPlayer.removeListener('play', tracking)

// musicPlayer.once('play', function (){
//     this.audioFirstStarted = new Date()
// })

musicPlayer.emit('play', 'The Roots - The Fire')

setTimeout(function () {
    musicPlayer.emit('stop')
}, 1000)

// if not inherit
var EventEmitter = events.EventEmitter

function MusicPlayer2(track) {
    this.track = track
    this.playing = false

    for (var methodName in EventEmitter.prototype) {
        this[methodName] = EventEmitter.prototype[methodName]
    }
}

MusicPlayer2.prototype = {
    toString: function () {
        if (this.playing) {
            return 'Now playing: ' + this.track
        } else {
            return 'Stopped.'
        }
    }
}

var musicPlayer2 = new MusicPlayer2('Girl Talk - Still Here')

musicPlayer2.on('play', function () {
    this.playing = true
    console.log(this.toString())
    this.emit('error', 'unable to play')
})

musicPlayer2.on('error', function (err) {
    console.log('Error:', err)
})

musicPlayer2.emit('play')