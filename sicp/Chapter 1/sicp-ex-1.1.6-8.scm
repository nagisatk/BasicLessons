#lang scheme

; Exercise 1.6
; scheme uses the applicative-order to run the application/script
; so the else-clause will always be calculated
; it will not end

; Exercise 1.7
; test case for the small value
; (load ".\\sicp-ch-1.1.7.scm")
(define rt (sqrt 0.0001))
; rt: 0.03230844833048122
(define (square x)
    (* x x))
(define sq (square rt))
; sq: 0.0010438358335233748
; (< (abs (- sq rt)) 0.01)
; but the exact square root of 0.0001 is 0.01

; test case for the big value
; (omit)
; if the value is big
; the call-stack will be so deep
; that the calculatiom may take a badly long time

; better guess-enough?
(define (sqrt-iter pre-guess cur-guess x)
    (if (good-enough? cur-guess pre-guess)
        cur-guess
        (sqrt-iter cur-guess (improve cur-guess x)
            x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (/ (- guess x) x)) 0.0001))

(define (square-root x)
    (sqrt-iter x 1.0 x))

(square-root 0.000001)
(square-root 4e63)

; Exercise 1.8
(define (cube-root x)
    (cbrt-iter x 1.0 x))
(define (cbrt-iter pre-guess cur-guess x)
    (if (good-enough? cur-guess pre-guess)
        cur-guess
        (cbrt-iter  cur-guess
            (improve-cube cur-guess x)
            x)))
(define (improve-cube cur-guess x)
    (/  (+  (/  x
                (* cur-guess cur-guess))
            (* 2 cur-guess))
        3))
(cube-root 27)