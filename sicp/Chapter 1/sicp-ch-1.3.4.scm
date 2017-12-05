#lang scheme

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (square x)
  (* x x))

((average-damp square) 10)

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

(define (Sqrt x)
  (fixed-point  (average-damp (lambda (y) (/ x y)))
                1.0))
(Sqrt 2)

(define (cube-root x)
  (fixed-point  (average-damp (lambda (y) (/ x (square y))))
                1.0))
(cube-root 27)

; Newton Methods
; derive

(define (deriv g)
  (lambda (x) 
    (/  (- (g (+ x dx)) (g x))
        dx)))
(define dx 0.00001)

(define (cube x)
  (* x x x))
((deriv cube) 5)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newton-method  (lambda (y) (- (square y) x))
                  1.0))
(sqrt 2)

; 抽象和第一级过程
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt2 x)
  (fixed-point-of-transform (lambda (y) (- (- (square y) x)))
                            newton-transform
                            1.0))
(sqrt2 2)