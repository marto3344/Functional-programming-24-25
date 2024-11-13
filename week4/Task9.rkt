#lang racket
(define (insert-at element index xs)
   (if (> index (length xs))
    (error "Invalid index!")
    (append (first (combinations xs index)) (list element) (last (combinations xs (- (length xs) index))));Not sure if this is the optimal way.But it's 1 line solution :)
     )
  )

(equal? (insert-at 1 0 '()) '(1))
(equal? (insert-at 1 0 '(2)) '(1 2))
(equal? (insert-at 10 1 '(1 2 3)) '(1 10 2 3))
(equal? (insert-at 1 0 '()) '(1))
(equal? (insert-at 1 0 '(2)) '(1 2))
(equal? (insert-at 10 1 '(1 2 3)) '(1 10 2 3))
(equal? (insert-at 7 0 '(1 2 3)) '(7 1 2 3))
(equal? (insert-at 7 1 '(1 2 3)) '(1 7 2 3))
(equal? (insert-at 7 3 '(1 2 3)) '(1 2 3 7))
(equal? (insert-at 7 1 '(1 2 3)) '(1 7 2 3));my test