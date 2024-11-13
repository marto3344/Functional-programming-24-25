#lang racket
(require racket/trace)
(define (filter-list xs)
  (define (helper ys result)
    (cond
     [(null? ys) result]
     [(list? (car ys)) (helper (cdr ys) (append result (helper (car ys) '())))]
     [else (helper (cdr ys) (append result (list (car ys))))]
      )
    )
  (helper xs '())

  )
(define (my-flatten xs)
  (define (helper results ys)
    (cond
      [(null? ys) results]
      [(list? (car ys)) (helper (append results  (filter-list (car ys))) (cdr ys))]
      [else (helper (append results (list (car ys))) (cdr ys))]
      )
   
  )
  (helper '() xs)
  )
(equal? (my-flatten '((1 2 3) (4 5 6) ((7 8) (9 10 (11 (12)))))) '(1 2 3 4 5 6 7 8 9 10 11 12))
(equal? (my-flatten '(422 22 ((((11))) 33) (131 31 121 12121 11 (12555 555)))) '(422 22 11 33 131 31 121 12121 11 12555 555))