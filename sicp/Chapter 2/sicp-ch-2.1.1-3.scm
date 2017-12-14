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

(newline)
; Exercise 2.3

(define (make-react1 leftdown rightup)
  (cons leftdown rightup))
(define (width1 rect)
  (- (x-point (cdr rect)) (x-point (car rect))))
(define (height1 rect)
  (- (y-point (cdr rect)) (y-point (car rect))))

(define (make-react2 wid hei)
  (cons wid hei))
(define (width2 rect)
  (car rect))
(define (height2 rect)
  (cdr rect))

(define (circle rect width height)
  (* 2 (+ (width rect)
          (height rect))))
(define (area rect width height)
  (* (width rect) (height rect)))

(define a (make-react1 (make-point 0 0) (make-point 2 3)))
(define b (make-react2 2 3))

(circle a width1 height1)
(area a width1 height1)

(circle b width2 height2)
(area b width2 height2)

; Chapter 2.1.3

; Exercise 2.4

; transform to JavaScript in Prove.js

(define (exp2 a n)  ; Recursive
  (if (= a 0)
    1
    (* n (exp2 (- a 1) n))))
(define (exp3 a n)  ; Loop
  (define (innerexp x result)
    (if (= a x)
      result
      (innerexp (+ 1 x) (* n result))))
  (innerexp 0 1))

(define (exp-pair a b)
  (*  (exp3 2 a)
      (exp3 3 b)))
(exp-pair 4 3)  ; 432

; Exercise 2.6
(define zero
  (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
((zero 0) 0)  ; 0
; (add-1 zero)

; (lambda (f) (lambda (x) (f ((n f) x))))
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (zero f)
; (lambda (x) x)

; (define one
;   (lambda (f) (lambda (x) (f x))))

; (add-1 one)
; (lambda (f) (lambda (x) (f ((n f) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

; (define (common-add a b)
;   (a b))
; from http://sicp.readthedocs.io/en/latest/chp2/6.html
; (define common-add
;   (lambda (m) (lambda (n) (lambda (f) (lambda (x) (m f (n f x)))))))
