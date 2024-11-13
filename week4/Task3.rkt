#lang racket

(define (rev-fold xs)
   (foldr (λ (x y) (+ x (* 10 y))) 0 xs)
  )

(define (rev-lin-iter xs)
   (define (helper result ys)
      (if (= (length ys) 1)
         (+ (* result 10) (first ys))
         (helper (+ (* result 10) (last ys)) (reverse (cdr (reverse ys)))
        )
     )
    )
    (if (null? xs)
      (error "The list is empty!")
      (helper 0 xs)
     )
  )
; using folding
(= (rev-fold '(1 2 3)) 321)
(= (rev-fold '(1 2 3 4 5 6 7 8 9)) 987654321)
(= (rev-fold '(1 2 8 9)) 9821);my test

; using a linearly iterative procedure
(= (rev-lin-iter '(1 2 3)) 321)
(= (rev-lin-iter '(1 2 3 4 5 6 7 8 9)) 987654321)
(= (rev-lin-iter '(1 2 8 9)) 9821);my test