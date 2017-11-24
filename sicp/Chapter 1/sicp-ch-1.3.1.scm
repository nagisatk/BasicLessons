#lang scheme
(define (cube x)
  (* x x x))
; sum of the integers from a through b
(define (sum-integers a b)
  (if (> a b)
    0
    (+ a (sum-integers (+ a 1) b))))
(sum-integers 1 10) ; 55

; sum of the cubes of the integers in the given range
(define (sum-cubes a b)
  (if (> a b)
    0
    (+ (cube a) (sum-cubes (+ a 1) b))))
(sum-cubes 1 4) ; 100
; sum of the sequence of terms in the series
; 1/(1 * 3) + 1/(5 * 7) + 1/(9 * 11)...
(define (pi-sum a b)
  (if (> a b)
    0
    (+  (/ 1.0 (* a (+ a 2)))
        (pi-sum (+ a 4) b))))
(* (pi-sum 1 9999) 8) ; 3.141392653591793

; common sum
(define (sum term a next b)
  (if (> a b)
    0
    (+  (term a)
        (sum term (next a) next b))))
(define (inc a)
  (+ a 1))

(define (sum-cubes2 a b)
  (sum cube a inc b))
(sum-cubes2 1 10)  ; 3025
(define (identity x)
  x)
(define (sum-integers2 a b)
  (sum identity a inc b))
(sum-integers2 1 100) ; 5050

(define (pi-sum2 a b)
  (define (pi-term n)
    (/ 1.0 (* n (+ n 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))
(* (pi-sum2 1 1000) 8)

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
      dx))
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)