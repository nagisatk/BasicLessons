#lang scheme

; Chapter 1.3.3
(define (average a b)
  (/ (+ a b) 2))
(define (close-enough? a b)
  (< (abs (- a b)) 0.001))
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough?  neg-point pos-point)
      midpoint
      (let ((test-value (f midpoint)))
      (cond ((positive? test-value) (search f neg-point midpoint))
            ((negative? test-value) (search f midpoint pos-point))
            (else midpoint))))))
(define (cube a)
  (* a a a))
(search cube (- 1) 1)

(define (half-interval-method f a b)
  (let ((a-value  (f a))
        (b-value  (f b)))
    (cond ((and (negative? a-value) (positive? b-value)) (search f a b))
          ((and (negative? b-value) (positive? a-value)) (search f b a))
          (else (error "Values are not of oppsite sign" a b)))))
; (half-interval-method cube (- 1) 1)
; (half-interval-method cube 1 2)

(half-interval-method sin 2.0 4.0)
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))
(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

(define (SQRT x)
  (fixed-point  (lambda (y) (average y (/ x y)))
                1.0))
(SQRT 2.0)