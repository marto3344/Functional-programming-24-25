#lang racket
(require math/number-theory)

(define (factorize n)
  (define (helper xs leftover  acc)
     (cond
       [(prime? leftover) (append xs (list leftover))]
       [(and (prime? acc) (zero? (remainder leftover acc))) (helper (append xs (list acc)) (quotient leftover acc) 2)]
       [else (helper xs leftover (add1 acc))]
       )
    )
   
   (if (< n 2)
     (error "n should be natural number greater than or equal to 2!")
      (helper '() n 2)
   )
  )

(equal? (factorize 2) '(2))
(equal? (factorize 6) '(2 3))
(equal? (factorize 13) '(13))
(equal? (factorize 123) '(3 41))
(equal? (factorize 152) '(2 2 2 19))
(equal? (factorize 12356498) '(2 7 11 19 41 103))
(equal? (factorize 34) '(2 17));my test
