#lang scheme

;; Chapter 1.1.1

;; combinations
(+ 137 349)

(- 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

;; an arbitrary number of arguments
(+ 21 35 12 7)

(* 25 4 12)

;; nested combinations
(+ (* 3 5) (- 10 6))

(+  (*  3
        (+  (* 2 4)
            (+ 3 5)))
    (+  (- 10 7)
        6))

;; Chapter 1.1.2

(define size 2)

(* 5 size)

(define pi 3.14159)

(define radius 10)

(* pi (* radius radius))

(define circumference (* 2 pi radius))

circumference