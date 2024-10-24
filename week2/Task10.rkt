#lang racket
(define (automorphic? n)
  (define (check-nums? a a-squared)
    (cond
      [(< a 10)(= a(remainder a-squared 10))]
      [(=(remainder a 10)(remainder a-squared 10))(check-nums?(quotient a 10)(quotient a-squared 10))]
      [else #f]
     )
    )
    (if(< n 0)
      (error "n has to be natural!")
      (check-nums? n (expt n 2))
    )
  )
(equal? (automorphic? 3)#f)
(equal? (automorphic? 10)#f)
(equal? (automorphic? 5)#t)
(equal? (automorphic? 25)#t)
(equal? (automorphic? 76)#t) 
(equal? (automorphic? 890625)#t) 
(equal? (automorphic? 625)#t) 
(equal? (automorphic? 36) #f)
(equal? (automorphic? 11) #f)
(equal? (automorphic? 12) #f);my test