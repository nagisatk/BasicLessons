// Exercise 2.4

function cons(x, y) {
    return function(f) {
        return f(x, y)
    }
}

function car(z) {
    return z(function(x, y) {
        return x
    })
}

var a = cons(1, 2)
var b = car(a)

console.log(b)  // 1

function cdr(z) {
    return z(function(x, y) {
        return y
    })
}

var c = cdr(a)

console.log(c)  // 2

// Exercise 2.6

function zero() {
    return function(f) {
        return function(x) {
            return x
        }
    }
}

function add1(n) {
    return function(f) {
        return function(x) {
            return f(n(f)(x))
        }
    }
}

console.log(zero()(0)(0))   // 0
