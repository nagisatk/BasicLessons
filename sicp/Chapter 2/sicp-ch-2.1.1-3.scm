#lang scheme

; Greatest Common Divsor from 1.2.5
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (add-rat x y)
  (make-rat (+  (* (numer x) (denom y))
                (* (numer y) (denom x)))
            (*  (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (-  (* (numer x) (denom y))
                (* (numer y) (denom x)))
            (*  (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (=  (* (numer x) (denom y))
      (* (numer y) (denom x))))
(define x (cons 1 2))
(car x)
(cdr x)


; Exercise 2.1
(define (make-rat n d)
  (cond ((< d 0) (make-rat (- n) (- d)))
        (else (let ((g (abs (gcd n d))))
                (cons (/ n g) (/ d g))))))
(define (numer x)
  (car x))
(define (denom x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))

(print-rat (add-rat one-half one-third))
(print-rat (sub-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (div-rat one-half one-third))
(print-rat (add-rat one-third one-third))

(print-rat (make-rat 4 (- 8)))


; Exercise 2.2
(define (make-point x y)
  (cons x y))

(define x-point car)
(define y-point cdr)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define (midpoint-segment seg)
  (make-point (/  (+ (x-point (start-segment seg))
                    (x-point (end-segment seg)))
                  2)
              (/  (+ (y-point (start-segment seg))
                    (y-point (end-segment seg)))
                  2)))
(define s (make-point 98 109))
(define e (make-point 88 1))
(define seg (make-segment s e))
(define m (midpoint-segment seg))
(print-point m)