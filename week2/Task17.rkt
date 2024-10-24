#lang racket
(define (remove-first-occurrence n m)
  (define(calculate-result  pos leftover)
      (cond
        [(= (remainder leftover 10) m) (+ (* (quotient leftover 10) (expt 10 pos)) (remainder n (expt 10 pos)))]
        [(< leftover 10) n];Ako ne sme namerili m
        [else (calculate-result  (add1 pos) (quotient leftover 10))]
     )
    )
  (calculate-result  0 n)
  )

(= (remove-first-occurrence 15365 5) 1536)
(= (remove-first-occurrence 15360 0) 1536)
(= (remove-first-occurrence 15300 0) 1530)
(= (remove-first-occurrence 35365 3) 3565)
(= (remove-first-occurrence 1212 1) 122)
(= (remove-first-occurrence 1212 2) 121)
(= (remove-first-occurrence (remove-first-occurrence 1212 1) 1) 22)
(= (remove-first-occurrence 12365 2) 1365);my test