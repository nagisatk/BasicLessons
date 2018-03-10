#lang scheme
(define x
    (cons (list 1 2) (list 3 4)))
(length x)
(list x x)

(length (list x x))

(define (count-leaves tree)
    (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))
(count-leaves x)            ; 4
(count-leaves (list x x))   ; 8

; exercise 2.24
(list 1 (list 2 (list 3 4)))
; (1 (2 (3 4)))

;  root
;   /\
;  /  \
; 1   /\
;    /  \
;   2   /\
;      /  \
;     3    4
; exercise 2.25
(define a (list 1 3 (list 5 7) 9))
(define b (list (list 7)))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdr (car (cdr (cdr a)))))
(car (car b))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))))))

(cons (list 1 2 3)
      (list 4 5 6))