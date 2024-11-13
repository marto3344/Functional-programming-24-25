#lang racket
(require racket/trace)
(define (deep-delete xs)
   (define (helper ys results car-count)
      (cond
         [(null? ys) results]
         [(list? (car ys)) (helper (cdr ys) (append results (list (helper (car ys) '() (add1 car-count)))) car-count)]
         [(< (car ys) car-count) (helper (cdr ys) results car-count)]
         [else (helper (cdr ys) (append results (list (car ys))) car-count)]

        )

     )
   (helper xs '() 1)
  )

(equal? (deep-delete '(1 (2 (2 4) 1) 0 (3 (1)))) '(1 (2 (4)) (3 ())))
(equal? (deep-delete '(3 ((1)) 1 ((((3)) 2) 42) 3 (6) 1 0 (3 1 (((9))) 0))) '(3 (()) 1 (((())) 42) 3 (6) 1 (3 (((9))))))