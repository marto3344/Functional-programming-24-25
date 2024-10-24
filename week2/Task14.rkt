#lang racket
(define (des-order? n)
   (define (check-order? curr-num leftover)
         (if(< leftover 10)
            (>= leftover curr-num)
            (and (<= curr-num (remainder leftover 10)) (check-order? (remainder leftover 10) (quotient leftover 10)))
            )
    )
    (or (< n 10) (check-order? (remainder n 10) (quotient n 10)))   
 )
(define (sum-numbers start finish)
     (define (sum ptr end)
         (cond
           [(> ptr end) 0]
           [(des-order? ptr)(+ ptr (sum (add1 ptr) end))]
           [else (sum (add1 ptr) end)]
        )
       )
      (sum (min start finish) (max start finish))
  )

(= (sum-numbers 1 9) 45)
(= (sum-numbers 199 203) 200)
(= (sum-numbers 219 225) 663)
(= (sum-numbers 225 219) 663)
(= (sum-numbers 199 210) 410);my test

