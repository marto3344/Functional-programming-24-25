#lang racket
(require math/number-theory)

(define (nth-cubic n)
   (define (helper upBound numsCount result)
      (cond
         [(>= numsCount n) result]
         [(prime? (- (expt upBound 3) (expt (sub1 upBound) 3))) (helper (add1 upBound) (add1 numsCount) (- (expt upBound 3) (expt (sub1 upBound) 3)))]
         [else (helper (add1 upBound) numsCount result)]
     )
   )
   (if(negative? n)
    (error "n has to be non negative")
    (helper 2 0 0) 
    )
  )

(= (nth-cubic 1) 7)
(= (nth-cubic 4) 61) ; 61 is the 4th cubic prime number
(= (nth-cubic 50) 55897) ; 55897 is the 50th cubic prime number
(= (nth-cubic 100) 283669)
(= (nth-cubic 200) 1570357)
(= (nth-cubic 2) 19);my test

#|
  1. nth-cubic
  2.  1 parameter -> the idex of the element of the sequence
  3. whole number
  4. n
  5. whole number
  6. If we had good recursive definition for the sequence the task would be elementary but unfortunately I haven't found one.
|#