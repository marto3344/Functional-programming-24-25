#lang racket
(define (apply-n f n)
  (λ(x)
    (if(zero? n)
      x  
      ((apply-n f(sub1 n))(f x))
     )
    )
  )
(= ((apply-n (λ (x) (* 2 x)) 5) 2) 64)
(= ((apply-n (λ (x) (quotient x 10)) 2) 100) 1)
(= ((apply-n (λ (x) (* 2 x)) 6) 2) 128);my test