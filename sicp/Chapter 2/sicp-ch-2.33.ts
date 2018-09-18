import { car, cdr, isnull, isequal, cons, display_set } from '../basic'

// unsorted set
function element_of_set(x: any, set: Function): boolean {
    if (isnull(set)) return false
    // else if (typeof set !== 'function') return isequal(x, set)
    else if (isequal(x, car(set))) return true
    else return element_of_set(x, cdr(set))
}

function adjoin_set(x: any, set: Function): Function {
    if (element_of_set(x, set)) return set
    else return cons(x, set)
}

function intersection_set(set1: Function, set2: Function): Function {
    if (isnull(set1) || isnull(set2)) return null
    // else if (typeof set1 !== 'function') {
    //     if (element_of_set(set1, set2)) return set1
    //     else return null
    // }
    else if (element_of_set(car(set1), set2))
        return cons(car(set1), intersection_set(cdr(set1), set2))
    else
        return intersection_set(cdr(set1), set2)
}

var set1 = cons(1, cons(2, 3))
var set2 = cons(4, cons(5, 6))
display_set(set1)
display_set(adjoin_set(0, set2))
display_set(intersection_set(set1, set2))

// exercise 2.59
function union_set(set1: Function, set2: Function): Function {
    if (isnull(set1)) return set2
    else if (isnull(set2)) return set1
    // else if (typeof set1 !== 'function') return adjoin_set(set1, set2)
    else return union_set(cdr(set1), adjoin_set(car(set1), set2))
}

display_set(union_set(set1, set2))

// sorted set
function element_of_set2(x: any, set: Function): boolean {
    if (isnull(set)) return false
    // else if (typeof set !== 'function') return x === set
    else if (x === car(set)) return true
    else if (x < car(set)) return false
    else return element_of_set2(x, cdr(set))
}

function intersection_set2(set1: Function, set2: Function): Function {
    if (isnull(set1) || isnull(set2)) return null
    var x1 = car(set1), x2 = car(set2)
    if (x1 === x2) return cons(x1, intersection_set2(cdr(set1), cdr(set2)))
    else if (x1 < x2) return intersection_set2(cdr(set1), set2)
    else if (x1 > x2) return intersection_set2(set1, cdr(set2))
}

display_set(intersection_set2(set1, set2))
function adjoin_set2(x: any, set: Function): Function {
    if (isnull(set)) return x
    if (element_of_set2(x, set)) return set
    var x1 = car(set)
    if (x > x1) return cons(x1, adjoin_set2(x, cdr(set)))
    else if (x < x1) return cons(x, set)
    else throw (new Error('unexpected error'))
}

display_set(adjoin_set2(0, set1))
display_set(adjoin_set2(1, set1))
display_set(adjoin_set2(2, set1))
display_set(adjoin_set2(3, set1))
display_set(adjoin_set2(4, set1))

function union_set2(set1: Function, set2: Function): Function {
    if (isnull(set1)) return set2
    else if (isnull(set2)) return set1
    var x1 = car(set1), x2 = car(set2)
    if (x1 === x2) return cons(x1, union_set2(cdr(set1), cdr(set2)))
    else if (x1 < x2) return cons(x1, union_set2(cdr(set1), set2))
    else if (x1 > x2) return cons(x2, union_set2(set1, cdr(set2)))
    else throw (new Error('unexpected error'))
}
display_set(union_set2(set1, set2))

var set3 = cons(1, cons(3, cons(5, cons(7, 9))))
var set4 = cons(2, cons(4, cons(6, cons(8, 10))))
display_set(union_set(set3, set4))
display_set(union_set2(set3, set4))

var N = 11  // max value, if > 11, throw Maximum call stack size exceeded

var set5 = cons(2**N + 3, 2**N + 5)
var set6 = cons(2**N + 2, 2**N + 4)
console.time('lll')
for (var i = 2 ** N; i > -1; i--) {
    set5 = cons(i * 2 + 1, set5)
    set6 = cons(i * 2, set6)
}
console.timeEnd('lll')



console.time("label1")
// union_set(set5, set6)
intersection_set(set5, set6)
console.timeEnd("label1")

console.time("label2")
// union_set2(set5, set6)
intersection_set2(set5, set6)
console.timeEnd("label2")