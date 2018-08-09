function Bomb() {
    this.message = 'Bomb'
}

Bomb.prototype.explode = function () {
    console.log(this)
    console.log(this.message)
}

var bomb = new Bomb()
var timeoutId = setTimeout(bomb.explode.bind(bomb), 1000)
// setTimeout(function () {
//     bomb.explode()
// }, 1000)

clearTimeout(timeoutId)

// 2.19
console.log('2.19')

function tick() {
    console.log('tick:', Date.now())
}

function tock() {
    console.log('tock:', Date.now())
}

setInterval(tick, 1000)

setTimeout(function () {
    setInterval(tock, 1000)
}, 500)