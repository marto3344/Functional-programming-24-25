#lang racket

(define (remove-all-no-proc x xs)
   (define (helper result start end)
      (cond
        [(= start end) result]
        [(equal? (list-ref xs start) x) (helper result (add1 start) end)]
        [else (helper (append result (list (list-ref xs start))) (add1 start) end)]
        )
     )
   (helper '() 0 (length xs))
  )
(define (remove-all-proc x xs)
  (remove* (list x) xs)
  )

(equal? (remove-all-no-proc 1 '(1 1 1 2)) '(2))
(equal? (remove-all-no-proc 1 '(2 5 6)) '(2 5 6))
(equal? (remove-all-no-proc 1 '(1)) '())
(equal? (remove-all-no-proc 1 '(1 2 1 1)) '(2))
(equal? (remove-all-no-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN"))
(equal? (remove-all-no-proc 1 '(1 2 3 4 1 1)) '(2 3 4));my test

(equal? (remove-all-proc 1 '(1 1 1 2)) '(2))
(equal? (remove-all-proc 1 '(2 5 6)) '(2 5 6))
(equal? (remove-all-proc 1 '(1)) '())
(equal? (remove-all-proc 1 '(1 2 1 1)) '(2))
(equal? (remove-all-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN"))
(equal? (remove-all-proc 1 '(1 2 3 4 1 1)) '(2 3 4));my test