#lang racket
(define (fibonacci n)
  (define (helper leftover n0 n1)
    (cond
      [(zero? leftover) n0]
      [(= leftover 1) n1]
      [else (helper (sub1 leftover) n1 (+ n0 n1))]
      )
    )
   (helper n 0 1)
  )

(define (num-to-list n) 
  (define (helper leftover xs)
     (if (zero? leftover)
         xs
         (helper  (quotient leftover 10) (append xs (list (remainder leftover 10))))
      )
    )
  (reverse (helper  n'()))
  )

(define (split-into-groups n k)
  (define (helper groups n-digits)
    (if (<= (length n-digits) k)
     (append groups (list n-digits))
     (helper (append groups (list (take n-digits k))) (drop n-digits k))
    )
  )
  
  (helper '() (num-to-list n))
 )

(define (count-occurrences p xs)
  (cond
    [(null? xs) 0]
    [(= (car xs) p) (add1 (count-occurrences p (cdr xs)))]
    [else (count-occurrences p (cdr xs))]
    )
  )

(define (find-max-element xs)
   (define (helper x count ys)
     (cond
       [(null? ys) (cons x count)]
       [(or (> (count-occurrences (car ys) ys) count) (and (<= (car ys) x ) (>= (count-occurrences (car ys) ys) count)))
        (helper (car ys) (count-occurrences (car ys) ys) (remove* (list (car ys)) ys))]
       [else (helper x count (remove* (list (car ys)) ys))]
       )
     )
    (helper (car xs) (count-occurrences (car xs) xs) (remove* (list (car xs)) xs))
  )
(define (max-elements groups)
  (define (helper xs results)
     (if (null? xs)
         results
        (helper (cdr xs) (append results (list (find-max-element (car xs)))))    
    )
    )
   (helper groups '())
  )
(define (around-fib n)
  (λ (k) (max-elements (split-into-groups (fibonacci n) k)))
  )

(equal? ((around-fib 100) 25) '((1 . 3)))
(equal? ((around-fib 180) 25) '((1 . 5) (7 . 3))) 
(equal? ((around-fib 1700) 25)
 '((1 . 4) (2 . 5) (0 . 6) (4 . 5) (5 . 7) (2 . 4) (6 . 7) (3 . 5) (0 . 4) (8 . 5) (4 . 5) (4 . 4) (7 . 7)(7 . 6) (2 . 2)))
(equal? ((around-fib 500) 42) '((0 . 6) (2 . 7) (2 . 6))) 
(equal? ((around-fib 6000) 242) '((5 . 31) (8 . 33) (8 . 31) (7 . 35) (7 . 31) (4 . 7)))