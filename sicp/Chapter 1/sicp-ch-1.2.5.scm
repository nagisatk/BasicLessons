#lang scheme
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; Exercise 1.20
(gcd 206 40)
(gcd 40 (remainder 206 40)) ; 1st remainder
(gcd 40 6)
(gcd 6 (remainder 40 6))    ; 2nd remainder
(gcd 6 4)
(gcd 4 (remainder 6 4))     ; 3rd remainder
(gcd 4 2)
(gcd 2 (remainder 4 2))     ; 4th remainder
(gcd 2 0)
2