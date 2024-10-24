#lang racket
(require math/number-theory)
(define(max-multiple d b)
   (define (find-num n)
       (cond
        [(and (not (negative? n))(divides? d n))n]
        [(zero? n) -1];if we haven't found such number
        [else (find-num(sub1 n))]
       )
     )
    (if(not (positive? b))
       (error "bound should be positive!")
       (find-num b)
       )
  )
(= (max-multiple 2 7) 6)
(= (max-multiple 3 10) 9)
(= (max-multiple 7 17) 14)
(= (max-multiple 10 50) 50)
(= (max-multiple 37 200) 185)
(= (max-multiple 7 100) 98)
(= (max-multiple 3 100) 99);my test