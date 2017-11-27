#lang scheme

(define (cube x)
  (* x x x))
; common sum
(define (sum term a next b)
  (if (> a b)
    0
    (+  (term a)
        (sum term (next a) next b))))
(define (inc a)
  (+ a 1))
; Exercise 1.29 Simpson's Rule
(define (simpson-rule f a b n)
  (define h     (/ (- b a) n))
  (define (y-iter k) (f (+ a (* k h))))
  (define (y k)
    (cond ((or (= k 0) (= k n)) (y-iter k))
          (else (*  (if (even? k)
                        2
                        4)
                    (y-iter k)))))
  (define (simpson-iter e)
    (if (= 0 e)
      (y e)
      (+ (y e) (simpson-iter (- e 1)))))
  (* (/ h 3.0) (simpson-iter n))) ; self-design
  ; (* (/ h 3.0) (sum y 0 inc n)))  ; use sum from book
(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)

; Exercise 1.30
(define (sum-30 term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))
(define (simpson-rule-30 f a b n)
  (define h     (/ (- b a) n))
  (define (y-iter k) (f (+ a (* k h))))
  (define (y k)
    (cond ((or (= k 0) (= k n)) (y-iter k))
          (else (*  (if (even? k)
                        2
                        4)
                    (y-iter k)))))
  (define (sum-term n)
    (* (/ h 3.0) (y n)))
  (sum-30 sum-term 0 inc n))
(simpson-rule-30 cube 0 1 100)

; Exercise 1.31
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (fact-term a)
  a)
(define (product-recursive term a next b)
  (if (> a b)
    1
    (*  (term a)
        (product-recursive term (next a) next b))))
(define (factorial-iterative n)
  (product-iterative fact-term 1 inc n))
(factorial-iterative 10)

(define (factorial-recursive n)
  (product-recursive fact-term 1 inc n))
(factorial-iterative 10)
(factorial-recursive 10)

; Exercise 1.32
(define (accu-recu combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accu-recu combiner null-value term (next a) next b))))
(define (sum-recu term a next b)
  (accu-recu + 0 term a next b))
(sum-recu cube 1 inc 5)

(define (prod-recu term a next b)
  (accu-recu * 1 term a next b))
(prod-recu fact-term 1 inc 10)

(define (accu-iter combiner null-value term a next b)
  (define (comb-iter a result)
    (if (> a b)
      result
      (comb-iter (next a) (combiner (term a) result))))
  (comb-iter a null-value))

(define (sum-iter term a next b)
  (accu-iter + 0 term a next b))
(sum-iter cube 1 inc 5)

(define (prod-iter term a next b)
  (accu-iter * 1 term a next b))
(prod-iter fact-term 1 inc 10)

; Exercise 1.33
(define (filltered-accumulate  combiner null-value term a next b)
  (define (comb-iter a result)
    (if (> a b)
      result
      (comb-iter (next a) (combiner (term a) result))))
  (comb-iter a null-value))