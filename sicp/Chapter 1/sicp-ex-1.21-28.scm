#lang scheme
(define (square x)
  (* x x))
; Chapter 1.1.6
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divise? test-divisor n) test-divisor)
        ; (else (find-divisor n (+ test-divisor 1)))))
        (else (find-divisor n (if (= test-divisor 2)      ; for Exercise 1.23
                                  3                       ;
                                  (+ test-divisor 2)))))) ;
(define (divise? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

; for Exercise 1.25
(define (fast-expt b n)
  (fast-iter 1 b n))
(define (fast-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-iter (square a) b (/ n 2)))
        (else (fast-iter (* a b) b (- n 1)))))
(define (expmod base exp m)
  ; (remainder (fast-expt base exp) m)) ; for Exercise 1.25
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
  ; (if (prime? n)
  (if (fast-prime? n 10)      ; for Exercise 1.24
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
    (display "\nover")))
; larger than 1000
; (search-for-primes 1000 1020)
; 1009 *** 0
; 1013 *** 0
; 1019 *** 0

; larger than 10000
; (search-for-primes 10000 10040)
; 10007 *** 0
; 10009 *** 0
; 10037 *** 0

; larger than 100000
; (search-for-primes 100000 100050)
; 100003 *** 0
; 100019 *** 0
; 100043 *** 0

; larger than 1000000
; (search-for-primes 1000000 1000040)
; 1000003 *** 0
; 1000033 *** 0
; 1000037 *** 0

; (search-for-primes  1000000000000000
;                     1000000000000400)
; 1000000000000037 *** 762
; 1000000000000091 *** 836
; 1000000000000159 *** 798
; 1000000000000187 *** 695
; 1000000000000223 *** 847
; 1000000000000241 *** 998
; 1000000000000249 *** 771
; 1000000000000259 *** 783
; 1000000000000273 *** 667
; 1000000000000279 *** 790
; 1000000000000297 *** 846
; 1000000000000357 *** 821
; 1000000000000399 *** 809
; (search-for-primes  10000000000000000
;                     10000000000000400)
; 10000000000000061 *** 2045
; 10000000000000069 *** 2158
; 10000000000000079 *** 2123

; Exercise 1.23
; (search-for-primes  1000000000000000
;                     1000000000000400)
; 1000000000000037 *** 321
; 1000000000000091 *** 323
; 1000000000000159 *** 320
; 1000000000000187 *** 328
; 1000000000000223 *** 375
; 1000000000000241 *** 328
; 1000000000000249 *** 339
; 1000000000000259 *** 326
; 1000000000000273 *** 322
; 1000000000000279 *** 325
; 1000000000000297 *** 320
; 1000000000000357 *** 324
; 1000000000000399 *** 320

; Exercise 1.24
; the number is too big to use random integer for fermat-test
; sigh
; (search-for-primes  1000000000000000
;                     1000000000000400)

; Exercise 1.25

; (search-for-primes 100000 100050)
; Not well at all
; the expmod keeps the number under the tested number
; but the fast-expt compute the number to a very big one
; which is as large as (base^exp) and maybe much larger
; than the max number that the scheme interpreter can deal with

; Exercise 1.26
; (define (expmod base exp m)
;   (cond ((= exp 0) 1)
;         ((even? exp)
;           (remainder  (*  (expmod base (/ exp 2) m)   ; the expmod procedure
;                           (expmod base (/ exp 2) m))  ; compute only once
;                       m))
;         (else
;           (remainder  (* base (expmod base (- exp 1) m))
;                       m))))

; Exercise 1.27
(define (fermat-all n)
  (display n)
  (define (try-it a)
    (if (= a n)
      (display " is prime.\n")
      (if (= (expmod a n n) a)
        (try-it (+ a 1))
        (display " is not a prime.\n"))))
  (try-it 2)
)
(define (iter-test start end)
  (fermat-all start)
  (if (= start end)
      (display "test over.\n")
      (iter-test (+ start 1) end)))
(iter-test 10 100)

(fermat-all 561)  ; 561 is prime.
(fermat-all 1105) ; 1105 is prime.
(fermat-all 1729) ; 1729 is prime.
(fermat-all 2465) ; 2465 is prime.
(fermat-all 2821) ; 2821 is prime.
(fermat-all 6601) ; 6601 is prime.