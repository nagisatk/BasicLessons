var myClass = require('./myModule')
var module2 = require('./module-2')

console.log(myClass.method())
console.log(module2.method())
console.log(module2.method2())

var group = require('./group')

group.one()
group.two()

// technique 4
console.log('__dirname:', __dirname)
console.log('__filename:', __filename)

// 2.11
var name = 'alex'
var user = { name: 'alex' }
console.log('Hello')
console.log('Hello %s', name)
console.log("hello:", name)
console.log('Hello:', user)

console.error('Error, bad user:', user)

// apply or call
function testApply(n) {
    console.log(n)
}

testApply.apply(this, [1, 2, 3, 4]) // 1
testApply.call(this, 1, 2, 3, 4)    // 1
testApply.call(this, [1, 2, 3, 4])  // 1, 2, 3, 4
testApply.apply(undefined, [10])