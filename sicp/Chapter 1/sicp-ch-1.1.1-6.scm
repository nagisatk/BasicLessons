#lang scheme

; Chapter 1.1.1

; combinations
(+ 137 349)

(- 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

; an arbitrary number of arguments
(+ 21 35 12 7)

(* 25 4 12)

; nested combinations
(+ (* 3 5) (- 10 6))

(+  (*  3
        (+  (* 2 4)
            (+ 3 5)))
    (+  (- 10 7)
        6))

; Chapter 1.1.2

(define size 2)

(* 5 size)

(define pi 3.14159)

(define radius 10)

(* pi (* radius radius))

(define circumference (* 2 pi radius))

circumference

; Chapter 1.1.4 Compound Procedures

(define (square x)
        (* x x))

(square 21)

(square (+ 2 5))

(square (square 3))

(define (sum-of-square x y)
        (+ (square x) (square y)))

(sum-of-square 3 4)

(define (f a)
        (sum-of-square (+ a 1) (* a 2)))

(f 5)

; Chapter 1.1.5 The Substitution Model fro Procedure Application
; Chapter 1.1.6 Conditonal Expression and Predicates

; (define (abs x)
;         (cond  ((> x 0) x)
;                 ((= x 0) 0)
;                 ((< x 0) (- x))))
; (define (abs x)
;         (cond   ((< x 0) (- x))
;                 (else x)))
(define (abs x)
        (if    (< x 0)
                (- x)
                x))
(abs -1)

(define (>= x y)
        (or (> x y) (= x y)))
(>= 10 9)

(define (<= x y)
        (not (> x y)))
(<= 10 9)