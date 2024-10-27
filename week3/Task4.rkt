#lang racket
(define (derive f eps)
  (λ(x)
    (/(-(f(+ x eps))(f x))
      eps)
    )
  )
(define (derive-n f n eps)
 (if (zero? n)
   f
   (derive-n (derive f eps)(sub1 n)eps)
  )
 )
(= ((derive-n (λ (x) (* 2 x x x)) 3 1e-3) 2) 12.000015203739167)
(= ((derive-n (λ (x) (* 2 x x x)) 4 1e-3) 4) 0.08526512829121202);my test
