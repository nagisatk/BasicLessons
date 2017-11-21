#lang scheme

; Exercise 1.1
; Exercise 1.2
(/  (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
  (* 3 (- 6 2) (- 2 7)))
; Exercise 1.3
(define (larger-sum-of-three x y z)
  (cond   ((and (> x y) (> z y)) (+ x z))
    ((and (> y x) (> z x)) (+ y z))
    (else (+ x y))))
(larger-sum-of-three 1 2 3)
(larger-sum-of-three 2 1 3)
(larger-sum-of-three 3 2 1)
(larger-sum-of-three 2 2 2)
; Exercise 1.4
; Exercise 1.5
; if the interperter is using applicative-order evaluation
; the procedures below will boom the interpreter
; racket is boomed
(define (p) (p))
(define (test x y)
  (if (x)
    0
    y))
(test 0 (p))