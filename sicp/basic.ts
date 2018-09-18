export function cons(x: any, y: any) {
    return function (f: Function) {
        return f(x, y)
    }
}

export function car(list: Function) {
    if (typeof list !== 'function')
        return list
    return list(function(x: any, y: any) {
        return x
    })
}

export function cdr(set: Function) {
    if (typeof set !== 'function') return null
    return set(function (x: any, y: any) {
        return y
    })
}

export function isnull(e: any) {
    return e === null
}

export function isequal(x: any, y: any) {
    return x === y
}

function display(a: any): string {
    if (typeof a === 'function') {
        return display(car(a)) + ', ' + display(cdr(a))
    } else if (isnull(a)) {
        return ''
    } else {
        return a
    }
}

export function display_set(set: Function) {
    console.log('[' + display(set) + ']')
}
