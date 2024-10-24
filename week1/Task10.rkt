#lang racket
(define (rev n)
   (define (reverse result leftover)
       (if (< leftover 10)
         (+ (* 10 result) leftover)
         (reverse (+(* result 10)(remainder leftover 10))(quotient leftover 10))
         )
     )
  (if(negative? n)
    (error "n has to be non-negative")
    (reverse 0 n)
   )
  )

(= (rev 1) 1)
(= (rev 123) 321)
(= (rev 987654321) 123456789)
(=(rev 544)445);my test