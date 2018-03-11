#lang scheme

(define a 1)
(define b 2)

(list a b)

(list 'a 'b)

(list 'a b)

(car '(a b c))
(cdr '(a b c))

(define (memq item x)
    (cond ((null? x) #f)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(memq 'a '(b c d))
(memq 'apple '(x (apple sauce) y apple pear))

; exercise 2.54
(define (equal? x y)
    (if (null? x)
        (if (null? y)
            #t
            #f)
        (if (null? y)
            #f
            (and (eq? (car x) (car y))
                (equal? (cdr x) (cdr y)))))
)
(equal? '(this is a list) '(this is a list))
(equal? '(this (is a) list) '(this is a list))

; exercise 2.55
 ''abracadabra  ; (quote abracadabra)