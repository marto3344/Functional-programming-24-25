#lang racket
(define (longest-ascending-sub xs)
   (define (helper curr-ys longest-ys ys)
      (cond
        [(and (null? ys) (>= (length longest-ys) (length curr-ys))) longest-ys]
        [(null? ys) curr-ys]
        [(or (null? curr-ys) (<= (last curr-ys) (car ys))) (helper (append curr-ys (list (car ys))) longest-ys (cdr ys))]
        [(< (length longest-ys) (length curr-ys)) (helper (list (car ys)) curr-ys (cdr ys) )]
        [else (helper (list (car ys)) longest-ys (cdr ys))]        
        )
     )
   (helper '() '() xs)
  )
(equal? (longest-ascending-sub '(1 0 5)) '(0 5))
(equal? (longest-ascending-sub '(1 5 2 3 1 5 6 7 7 1 5)) '(1 5 6 7 7))
(equal? (longest-ascending-sub '(1 5 2 3 1 5 2 7 7 15)) '(2 7 7 15))
(equal? (longest-ascending-sub '(1 5 2 3 4 5 6 7 7 1 5)) '(2 3 4 5 6 7 7))
(equal? (longest-ascending-sub '(1 5 2 4 6 8 3 4 1)) '(2 4 6 8))