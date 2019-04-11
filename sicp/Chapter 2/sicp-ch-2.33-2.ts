import { car, cdr, cadr, caddr, isnull, isequal, cons, display_set } from '../basic'

var entry = car, left_branch = cadr, right_branch = caddr

function maketree(ent: any, left: any, right: any) {
    return cons(ent, cons(left, right))
}