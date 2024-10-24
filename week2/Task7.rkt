#lang racket
(define (count-occurrences n d)
  (define (calculate num)
    (cond
    [(and (< num 10) (= num d)) 1]
    [(< num 10) 0]
    [(= (remainder num 10) d)(add1 (calculate(quotient num 10)))]
    [else (calculate (quotient num 10))]
    )
  )
  (if(or (negative? n) (negative? d))
     (error "params error")
     (calculate n)
     )
)
(= (count-occurrences 121 1) 2)
(= (count-occurrences 222 1) 0)
(= (count-occurrences 100 0) 2)
(= (count-occurrences 0 0) 1)
(= (count-occurrences 8888 8) 4);my test