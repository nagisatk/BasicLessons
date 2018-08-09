function monitor() {
    console.log(process.memoryUsage())
}

var id = setInterval(monitor, 1000)
console.log(id)
id.unref()
console.log(id)

setTimeout(function () {
    console.log('Done')
}, 5000)

