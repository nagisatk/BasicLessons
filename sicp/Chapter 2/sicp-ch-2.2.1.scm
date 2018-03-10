#lang scheme
(define one-through-four
    (list 1 2 3 4))
one-through-four
(car one-through-four)
(cdr one-through-four)

(cons 5 one-through-four)

(define (list-ref item n)
    (if (= n 0)
        (car item)
        (list-ref (cdr item) (- n 1))))

(list-ref one-through-four 2)   ; 3

(define squares (list 1 4 9 16 25))
(list-ref squares 2)    ; 9

(define (length item)
    (if (null? item)
        0
        (+ 1 (length (cdr item)))))
(length squares)    ; 5

(define odds (list 1 3 5 7))
(length odds)   ; 4
; recursive length
(define (rlength item)
    (define (length-iter a count)
        (if (null? a)
            count
            (length-iter (cdr a) (+ 1 count))))
    (length-iter item 0))
(rlength odds)  ; 4

; (append odds squares)
(define (append l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (append (cdr l1) l2))))
(append odds squares)


; exercise 2.17
(define nil '())
(define (last-pair l)
    (cond ((= (length l) 0) nil)
        ((= (length l) 1) l)
        ((= (length l) 2) (cdr l))
        (else (last-pair (cdr l)))
    )
)

(last-pair (list 1 2 3 4))  ; (4)
(last-pair (list 2 3 4))    ; (4)
(last-pair (list 3 4))      ; (4)
(last-pair (list 4))        ; (4)
(last-pair '())             ; ()


(define (push l e)
    (append l (list e)))

; exercise 2.18
(define (reverse items)
    (define (reverse-iter l1 n)
        (if (< n 0)
            l1
            (reverse-iter (push l1 (list-ref items n)) (- n 1))))
    (reverse-iter (last-pair items) (- (length items) 2)))
(reverse (list 1 2 3 4))
(reverse (list 1 2 3))
(reverse (list 1 2))
(reverse (list 1))
(reverse nil)

; exercise 2.19


; exercise 2.20
(define (same-parity h . x)
    (define res (list h))
    (define (same-iter item n)
        (if (= n (length x))
            item
            (if (= (remainder h 2) (remainder (list-ref x n) 2))
                (same-iter (push item (list-ref x n)) (+ n 1))
                (same-iter item (+ n 1)))))
    (same-iter res 0)
)

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)

; ---------

(define (scale-list items factor)
    (if (null? items)
        nil
        (cons (* (car items) factor)
              (scale-list (cdr items) factor))))
(scale-list (list 1 2 3 4) 2)   ; 2 4 6 8

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))
(map (lambda (x) (* x x)) (list 1 2 3 4))

; exercise 2.21
(define (square x)
    (* x x))
(define (square-list items)
    (if (null? items)
        nil
        (cons (square (car items))
              (square-list (cdr items)))))
(square-list (list 1 2 3 4))

(define (square-list2 items)
    (map square items))
(square-list2 (list 1 2 3 4))

; exercise 2.23
(define (for-each proc items)
    (cond ((null? items) nil)
        (else (proc (car items))
              (for-each proc (cdr items))))
)
(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4))