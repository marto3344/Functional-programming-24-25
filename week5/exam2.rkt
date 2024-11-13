#lang racket

(define (kth-number xs)
  (λ (p? k) (let ([filtered-xs (filter p? xs)])
       (if (> k (length filtered-xs))
          (error "No such number")
          (list-ref (sort filtered-xs <) (sub1 k))
       )
     )
    )
  )
(= ((kth-number '(1 2 3 4 -5 6)) odd? 2) 1)
(= ((kth-number '(1 2 3 4 -5 6)) negative? 1) -5)
(= ((kth-number '(1 2 3 4 -5 -5 6)) negative? 2) -5)
(= ((kth-number '(1 -4 2 3 4 -5 -5 6)) negative? 3) -4)
((kth-number '(-1 0 -1 0 -2)) negative? 4); error 