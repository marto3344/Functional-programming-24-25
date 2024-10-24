#lang racket
(define (p n)
  (define (calculate result ptr);pn= pn-1 +3n -2 Formula is from: https://math.stackexchange.com/questions/453562/formula-for-pentagonal-numbers
     (if (> ptr n)
        result
       (calculate (+ result (- (* 3 ptr) 2)) (add1 ptr))
      )
    )
   (if(<= n 0)
     (error "n should be greater than zero")
      (calculate 1 2)
      )

  )


(= (p 1) 1)
(= (p 2) 5)
(= (p 3) 12)
(= (p 4) 22)
(= (p 5) 35)
(= (p 6) 51)
(= (p 7) 70) ;my test