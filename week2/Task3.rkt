#lang racket
(require math/number-theory)
(define (sum-prime-divs-rec n)
 
  (define (sum d)
     (cond
       [(and (= n d)(prime? d))d]
       [(= n d) 0]
       [(and(divides? d n)(prime? d))(+ d(sum(add1 d)))]
       [else (sum(add1 d))]
     )
   )
   (if(negative? n)
    (error "n has to be non-negative!")
    (sum 0)
   )   
)
(= (sum-prime-divs-rec 0) 0)
(= (sum-prime-divs-rec 6) 5) ; 2 + 3
(= (sum-prime-divs-rec 18) 5) ; 2 + 3
(= (sum-prime-divs-rec 19) 19)
(= (sum-prime-divs-rec 45136) 53)
(= (sum-prime-divs-rec 10)7);my test