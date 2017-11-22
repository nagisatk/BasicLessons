#lang scheme

(define (expt1 b n)
  (if (= n 0)
    1
    (* b (expt1 b (- n 1)))))
(expt1 2 5)  ; 32
(define (expt2 b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* product b))))
  (expt-iter b n 1))
(expt2 2 5) ; 32

(define (fast-expt b n)
  (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))
(define (even? n)
  (= (remainder n 2) 0))
(define (square x)
  (* x x))
(fast-expt 2 5) ; 32
(define (fast-expt2 b n)
  (fast-iter 1 b n))
(define (fast-iter a b n)
  (cond ((= n 0) a)
      ((even? n) (fast-iter (square a) b (/ n 2)))
      (else (fast-iter (* a b) b (- n 1)))))
(fast-expt2 2 5)  ; 32