#lang scheme

; Exercise 1.11. A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) +
; 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure
; that computes f by means of an iterative process.
; f(n) = n if n < 3;
; f(n) = f(a) + 2f(b) + 3f(c) n > 3
(define (fr n)
  (if (< n 3)
    n
    (+ (fr (- n 1))
       (* 2 (fr (- n 2)))
       (* 3 (fr (- n 3))))))
(fr 1)
(fr 2)
(fr 3)
(fr 4)
(fr 5)
(fr 6)
(fr 7)
(fr 8)
(fr 9)

(define (fi n)
  (define (f-iter a b c i n)
    (if (= i n)
        a
        (f-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (+ i 1)
                n)))
  (if (< n 3)
    n
    (f-iter 2 1 0 2 n)))
(fi 1)
(fi 2)
(fi 3)
(fi 4)
(fi 5)
(fi 6)
(fi 7)
(fi 8)
(fi 9)

; Exercise 1.12. The following pattern of numbers is called Pascal’s triangle.
    ;     1
    ;    1 1
    ;   1 2 1
    ;  1 3 3 1
    ; 1 4 6 4 1
    ;    ...
; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the
; two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a
; recursive process.

(define (Pascal row col)
  (cond ((or (= row col) (= col 1)) 1)
        (else (+ (Pascal (- row 1) (- col 1)) (Pascal (- row 1) col)))))
(Pascal 3 3)
(Pascal 4 2)
(Pascal 4 3)
(Pascal 5 3)
(Pascal 5 4)