#lang scheme
; factorial
(define (factorial x)
  (if (= x 1)
    1
    (* x (factorial (- x 1)))))
(factorial 10)
(define (factorial2 x)
  (define (iter product counter)
    (if (> counter x)
      product
      (iter (* counter product) (+ counter 1))))
  (iter 1 1))
(factorial2 10)
