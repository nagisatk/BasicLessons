#lang scheme

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

; Newton Methods
; derive

(define (deriv g)
  (lambda (x) 
    (/  (- (g (+ x dx)) (g x))
        dx)))
(define dx 0.00001)

(define (cube x)
  (* x x x))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (square x)
  (* x x))
; Exercise 1.40
(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

((cubic 1 2 3) 1)

(newton-method (cubic 2 4 8) 1) ; -2

; Exercise 1.41
(define (double prog)
  (lambda (x) (prog (prog x))))

(define (inc x)
  (+ x 1))

((double inc) 2)

(((double (double double)) inc) 5)  ; 21

; Exercise 1.42
(define (compose g f)
  (lambda (x) (g (f x))))
((compose square inc) 6)  ; 49

; Exercise 1.43
; (define (repeated f n)
;   (if (= n 1)
;     f
;     (lambda (x) (f ((repeated f (- n 1)) x)))))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

((repeated square 2) 5)

; Exercise 1.44

(define (smooth f)
  (lambda (x) (/  (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                  3)))
(define (repeated-smooth f n)
  (repeated (smooth f)))

; Exercise 1.45

; Exercise 1.46
