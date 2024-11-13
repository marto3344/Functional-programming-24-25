#lang racket
(require racket/trace)
(define (g-l-sum limit)
  (define (helper x y)
     (if (= limit (+ (gcd x y) (lcm x y)))
         (cons x y)
         (helper (random 1 (sub1 limit)) (random 1 (sub1 limit)))
         )
      
    )
   (helper 1 1)
  )


(g-l-sum 2) ; → '(1 . 1)
(g-l-sum 14) ; → '(6 . 4)