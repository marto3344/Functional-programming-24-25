#lang racket

(define (num-bigger-elements nums)
  (map (λ (x) (cons x (length (filter (λ (y) (< x y)) nums)))) nums)
  )

(equal? (num-bigger-elements '(5 6 3 4)) '((5 . 1) (6 . 0) (3 . 3) (4 . 2)))
(equal? (num-bigger-elements '(1 1 1)) '((1 . 0) (1 . 0) (1 . 0)))
(equal? (num-bigger-elements '(1 2 1)) '((1 . 1) (2 . 0) (1 . 1)));my test