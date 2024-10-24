#lang racket
(define (sum-digits n)
   (if (< n 10)
     n
     (+ (remainder n 10) (sum-digits (quotient n 10)))
    )
  )
(define (digital-root n)
  (if (< n 10)
    n
    (digital-root (sum-digits n))
   )
  )

(= (digital-root 16) 7); => 1 + 6; => 7
(= (digital-root 942) 6); => 9 + 4 + 2; => 15; => 1 + 5; => 6
(= (digital-root 132189) 6)
(= (digital-root 493193) 2)
(= (digital-root 462) 3);my test