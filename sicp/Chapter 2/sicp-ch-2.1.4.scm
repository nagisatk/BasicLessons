#lang scheme

; Chapter 2.1.4

(define (add-interval x y)
  (make-interval  (+ (lower-bound x) (lower-bound y))
                  (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let   ((p1 (* (lower-bound x) (lower-bound y)))
          (p2 (* (lower-bound x) (upper-bound y)))
          (p3 (* (upper-bound x) (lower-bound y)))
          (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval  (min p1 p2 p3 p4)
                    (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x
                (make-interval  (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))
(define (make-interval x y)
  (cons x y))

; Exercise 2.7

(define lower-bound car)
(define upper-bound cdr)

(define a (make-interval 1.0 2.0))
(define b (make-interval 3.0 4.0))

(define (print-interval x)
  (display "[")
  (display (lower-bound x))
  (display ", ")
  (display (upper-bound x))
  (display "]")
  (newline))

(print-interval (add-interval a b)) ; [4.0, 6.0]
(print-interval (mul-interval a b)) ; [3.0, 8.0]
(print-interval (div-interval a b)) ; [0.25, 0.66666666]

; Exercise 2.8
(define (sub-interval x y)
  (add-interval x
                (make-interval  (- 0 (upper-bound y))
                                (- 0 (lower-bound y)))))
(print-interval (sub-interval a b)) ; [-3.0, -1.0]

; Exercise 2.9
