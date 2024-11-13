#lang racket
(define (find-max xs)
   (define (helper max ys)
     (cond
      [(null? ys) max]   
      [(< max (car ys)) (helper (car ys) (cdr ys))]
      [else (helper max (cdr ys))]
     )
    )
  (helper (car xs) (cdr xs))
  )
(define (right-max xs)
  (define (helper ys results)
    (if (null? ys)
      results
      (helper (cdr ys) (append results (list (find-max ys))))
     )
    )
  (helper xs '())
  )

(equal? (right-max '(1 2 3 4 -5 6 7 -2 -1 0)) '(7 7 7 7 7 7 7 0 0 0)) 
(equal? (right-max '(5 8 9 12)) '(12 12 12 12))
(equal? (right-max '(4 3 2 1 0)) '(4 3 2 1 0)) 