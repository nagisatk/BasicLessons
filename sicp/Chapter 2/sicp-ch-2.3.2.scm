#lang scheme

(define (variable? x)
    (symbol? x))

(define (same-variable? v1 v2)
    (and (variable? v1)
         (variable? v2)
         (eq? v1 v2)))

(define (make-sum e1 e2)
    (cond ((=number? e1 0) e2)
          ((=number? e2 0) e1)
          ((and (number? e1) (number? e2))
              (+ e1 e2))
          (else (list '+ e1 e2))))

(define (=number? expr num)
    (and (number? expr) (= expr num)))

; (define (make-sum e1 e2)
;     (list '+ e1 e2))

(define (make-product e1 e2)
    (cond ((or (=number? e1 0) (=number? e2 0)) 0)
        ((=number? e1 1) e2)
        ((=number? e2 1) e1)
        ((and (number? e1) (number? e2))
            (* e1 e2))
        (else (list '* e1 e2))))

; (define (make-product e1 e2)
;     (list '* e1 e2))

(define (sum? expr)
    (and (pair? expr) (eq? (car expr) '+)))

(define (addend e)
    (cadr e))

(define (augend e)
    (caddr e))

(define (product? x)
    (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
    (cadr p))
(define (multiplicand p)
    (caddr p))

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
              (if (same-variable? exp var) 1 0))
          ((sum? exp)
              (make-sum (deriv (addend exp) var)
                        (deriv (augend exp) var)))
          ((product? exp)
              (make-sum
                  (make-product (multiplier exp)
                                (deriv (multiplicand exp) var))
                  (make-product (deriv (multiplier exp) var)
                                (multiplicand exp))))
          (else
              (error "unknown expression type -- DERIV" exp))))

(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)