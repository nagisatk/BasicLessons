#lang scheme
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))
(define (pi-sum a b)
  (sum  (lambda (x) (/ 1.0 (* x (+ x 2))))
        a
        (lambda (x) (+ x 4))
        b))
(* (pi-sum 1 1000000) 8)

(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
      dx))
(define (cube x)
  (* x x x))
(integral cube 0 1 0.001)

(define (square x)
  (* x x))
((lambda (x y z) (+ x y (square z))) 1 2 3)

; f(x, y) = x*(1 + x*y)^2 + y*(1 - y) + (1 + x*y)(1 - y)
; a = 1 + x*y
; b = 1- y
; f(x, y) = x*a^2 + y*b + a*b

; (define (f x y)
;   (define (f-helper a b)
;     (+  (* x (square a))
;         (* y b)
;         (* a b)))
;   (f-helper (+ 1 (* x y))
;             (- 1 y)))
; (f 1 1) ; 4
; (f 1 0) ; 2

(define (f x y)
  (let  ((a (+ 1 (* x y)))
        (b (- 1 y)))
  (+  (* x (square a))
      (* y b)
      (* a b))))
(f 1 1) ; 4
(f 1 0) ; 2
(define (f g)
  (g 2))
; (f f)   ; duplicate definition for identifier