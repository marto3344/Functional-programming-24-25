#lang racket

(define (concat-proc xs ys)
  (append xs ys)
  )
(define (concat-rec xs ys)
   (define (helper result n end)
      (if (= n end)
         result
        (helper (append result (list (list-ref ys n))) (add1 n) end )
      )
     )
   (helper xs 0 (length ys))
  )
; using a predefined procedure
(equal? (concat-proc '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))
(equal? (concat-proc '(3 2 1) '(4 5 6)) '(3 2 1 4 5 6));my test

; using a linearly iterative process
(equal? (concat-rec '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))
(equal? (concat-rec '(3 2 1) '(4 5 6)) '(3 2 1 4 5 6));my test