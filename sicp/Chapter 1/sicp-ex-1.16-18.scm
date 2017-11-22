#lang scheme

; Exercise 1.16
(define (even? n)
  (= (remainder n 2) 0))
(define (square x)
  (* x x))
(define (fast-expt b n)
  (fast-iter 1 b n))
(define (fast-iter a b n)
  (cond ((= n 0) a)
      ((even? n) (fast-iter (square a) b (/ n 2)))
      (else (fast-iter (* a b) b (- n 1)))))
(fast-expt 2 5)  ; 32

; Exercise 1.17
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))
(define (multi a b)
  (multi-iter 0 a b))
(define (multi-iter x a b)
  (cond  ((= b 0) x)
          ((even? b) (double (multi-iter x a (halve b))))
          (else (+ a (multi-iter x a (- b 1))))))

(multi 5 4)
(multi 6 3)
(multi 7 8)
(multi 1 9)
(multi 0 9)
(multi 1 0)

; Exercise 1.18
(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))

(mult 5 4)
(mult 6 3)
(mult 7 8)
(mult 1 9)
(mult 0 9)
(mult 1 0)