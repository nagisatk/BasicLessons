#lang scheme

(define (square x)
    (* x x))

(define (sum-odd-squares tree)
    (cond ((null? tree) 0)
        ((not (pair? tree)) 
            (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))
(sum-odd-squares (list 1 2 (list 3 4) (list 5 6 (list 7 8))))  ; 84

(define (fib k)
    (cond (( = k 0) 0)
        ((= k 1) 1)
        (else (+ (fib (- k 1)) (fib (- k 2)))))
)

(define (even-fib n)
    (define (next k)
        (if (> k n)
            '()
            (let ((f (fib k)))
                (if (even? f)
                    (cons f (next (+ k 1)))
                    (next (+ k 1))))))
    (next 0))
(even-fib 14)
; 0 1 1 2 3 5 8 13 21 34 55 89 144 ...

(define (filter predicate sequence)
    (cond ((null? sequence) '())
        ((predicate (car sequence))
            (cons (car sequence)
                (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence))))
)

(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))   ; 15
(accumulate * 1 (list 1 2 3 4 5))   ; 120
(accumulate cons '() (list 1 2 3 4 5))

(define (enumerate-interval low high)
    (if (> low high)
        '()
        (cons low (enumerate-interval (+ low 1) high))))

(enumerate-interval 2 7)

(define (enumerate-tree tree)
    (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 (list 3 4)) 5))

(define (sum-odd-squares2 tree)
    (accumulate +
                0
                (map square
                    (filter odd?
                            (enumerate-tree tree)))))

(sum-odd-squares2 (list 1 2 (list 3 4) (list 5 6 (list 7 8))))  ; 84
(define (even-fib2 n)
    (accumulate cons
                '()
                (filter even?
                        (map fib (enumerate-interval 0 n)))))
(even-fib 14)

; exercise 2.34

(define (horner-eval x coefficient-sequence)
    (accumulate (lambda (this-coeff higher-terms) 
                    (+ this-coeff (* x higher-terms)))
                0
                coefficient-sequence))
(horner-eval 2 (list 1 3 0 5 0 1))

; exercise 2.35
(define (count-leaves t)
    (accumulate +
                0
                (map (lambda (node) 1)
                     (enumerate-tree t))))

(define x
    (cons (list 1 2) (list 3 4)))
(count-leaves x)            ; 4
(count-leaves (list x x))   ; 8

; exercise 2.36
(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map car seqs))
              (accumulate-n op init (map cdr seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 s)


; Nested Mapping
(accumulate append
            '()
            (map (lambda (i) 
                (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 10)))

(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(flatmap (lambda (i) 
            (map (lambda (j) (list i j))
                    (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 10))

(define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divise? test-divisor n) test-divisor)
          ; (else (find-divisor n (+ test-divisor 1)))))
          (else (find-divisor n (if (= test-divisor 2)      ; for Exercise 1.23
                                    3                       ;
                                    (+ test-divisor 2)))))) ;
  (define (divise? a b)
    (= (remainder b a) 0))
  
  (define (prime? n)
    (= (smallest-divisor n) n))

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; exercise 2.40
(define (unique-pairs n)
    (flatmap (lambda (i) 
        (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))
(define (prime-sum-pairs n)
    (map make-pair-sum
         (filter prime-sum?
                 (unique-pairs n))))
(prime-sum-pairs 6)

(define (remove x s)
    (filter (lambda (y) (not (= x y))) s))
(remove 1 (list 1 2 3 1))

(define (permutations s)
    (if (null? s)
        (list '())
        (flatmap (lambda (x)
                    (map (lambda (p) (cons x p))
                        (permutations (remove x s)))) s)))
(permutations (list 1 2 3))

; exercise 2.42
(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens) 
                        (map (lambda (new-row) 
                            (adjoin-position new-row k rest-of-queens))
                            (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1))))))
    (queen-cols board-size))
(define (adjoin-position new-row k rest-of-queens)
    (cons new-row rest-of-queens))

(define empty-board '())

; k for col
; (car position ) for row
(define (safe? k positions)
    (define (safe?-iter pre-col row rest)
        (if (null? rest)
            #t
            (and (not (or (= row (car rest))
                        (= (abs (- (car rest) row))
                            (abs (- pre-col k)))))
                (safe?-iter (- pre-col 1) row (cdr rest)))))
    (if (null? positions)
        #t
        (safe?-iter (- k 1) (car positions) (cdr positions)))
)

(queens 4)