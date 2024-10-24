#lang racket
(define (count-digits-iter num)
   (define (calculate result leftover)
     (if(< leftover 10)
      (add1 result)
      (calculate(add1 result)(quotient leftover 10))
     )
    )
     (if (negative? num)
       (error "n has to be non-negative")
       (calculate 0 num)
      )
  )
(define (count-digits-rec number)
   (cond
    [(negative? number) (error "n has to be non-negative")]
    [(< number 10) 1]
    [else (add1 (count-digits-rec (quotient number 10)))]
   )
  )
(= (count-digits-iter 12345) 5)
(= (count-digits-iter 123) 3)
(= (count-digits-iter 123456789) 9);my test

(= (count-digits-rec 12345) 5)
(= (count-digits-rec 123) 3)
(= (count-digits-rec 123456789)9);my test