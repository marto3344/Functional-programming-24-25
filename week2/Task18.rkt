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
(define (find-max n)
  (define (helper current-max leftover)
    (if (zero? leftover)
        current-max
        (helper
         (max current-max (remainder leftover 10))
         (quotient leftover 10)
         )
        )
    )
  (helper (remainder n 10) (quotient n 10))
  )

(define (sort-n n)
   (define (helper result num leftover)
      (if (zero? leftover)
        result
        (helper (+ (find-max num) (* result 10)) (remove-first-occurrence num (find-max num)) (quotient leftover 10))
     )   
   )
  (helper 0 n n)
 )
(= (sort-n 1714) 7411)
(= (sort-n 123450) 543210)
(= (sort-n 123405) 543210)
(= (sort-n 123045) 543210)
(= (sort-n 120345) 543210)
(= (sort-n 102345) 543210)
(= (sort-n 8910) 9810)
(= (sort-n 321) 321)
(= (sort-n 29210) 92210)
(= (sort-n 1230) 3210)
(= (sort-n 55345) 55543)
(= (sort-n 14752) 75421)
(= (sort-n 329450) 954320)
(= (sort-n 9125) 9521)
(= (sort-n 987601) 987610);my test