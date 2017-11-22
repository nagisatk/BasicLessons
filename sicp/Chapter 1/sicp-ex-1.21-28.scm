#lang scheme
(define (square x)
  (* x x))
; Chapter 1.1.6
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divise? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divise? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder  (* base (expmod base (- exp 1) m))
                          m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

; Exercise 1.21. Use the smallest-divisor procedure to find the smallest divisor of each of the
; following numbers: 199, 1999, 19999.
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

; Exercise 1.22
(define (runtime) (current-milliseconds))
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))
    (+ 1 1))) ; else expression
(define (report-not-prime n)
  (display " is not a prime number"))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
(define (search-for-primes start end)
  (timed-prime-test start)
  (if (not (= start end))
    (search-for-primes (+ start 1) end)
    (display "\nover ")))
; larger than 1000
(search-for-primes 1000 1020)
; larger than 10000
(search-for-primes 10000 10040)
; larger than 100000
(search-for-primes 100000 100050)
; larger than 1000000
(search-for-primes 1000000 1000040)