#lang racket
(define (set-union xs ys)
  (sort (remove-duplicates (append xs ys)) <)
  )

(equal? (set-union '(1 3 5 7) '(5 7 13)) '(1 3 5 7 13))
(equal? (set-union '(5 7 13) '(1 3 5 7)) '(1 3 5 7 13))
(equal? (set-union '(3 2) '(1 2)) '(1 2 3));my test