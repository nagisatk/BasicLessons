#lang scheme

(define (fib n)
  (cond ((= n 0) 1)
        ((= n 1) 1)
        (else (+  (fib (- n 1))
                  (fib (- n 2))))))
(fib 8)

(define (fib2 n)
  (fib-iter 1 0 n))
(define (fib-iter a b n)
  (if (= n 0)
    b
    (fib-iter (+ a b) a (- n 1))))
(fib2 9)

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
    ((or (< amount 0) (= kinds-of-coins 0)) 0)
    (else (+ (cc amount (- kinds-of-coins 1))
             (cc (- amount (first-denomination kinds-of-coins))
             kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
(count-change 100)