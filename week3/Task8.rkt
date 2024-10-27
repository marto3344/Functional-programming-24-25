#lang racket
(define (accumulate f acc start end transform next)
  (if (> start end)
      acc
      (accumulate f (f (transform start) acc) (next start) end transform next)
      )
  )

(define (cubed-interval-till n)
   (accumulate + 0 2 n (λ (x) (expt x 3)) (λ(x)(+ x 3)))
  )

(define (any? start end p?)
 (accumulate (λ (x y) (or x y)) #f (min start end) (max start end) p? add1)  
 )

(define (fact-accum n)
   (accumulate * 1 1 n identity add1)
  )

(define (prime-accum? n)
    (and (not (= n 1)) (accumulate (λ (x y) (and x y)) #t  2 (sub1 n) (λ (x) (not (zero? (remainder n x)))) add1))

  )

(equal? (any? 1001 1500 (λ (x) (< x 1000))) #f)
(equal? (any? 1 100 odd?) #t)
(equal? (any? 1 100 even?) #t);my test

(= (cubed-interval-till 11) 1976)
(= (cubed-interval-till 15) 4720)
(= (cubed-interval-till 5) 133);my test

(= (fact-accum 5) 120)
(= (fact-accum 8) 40320)
(= (fact-accum 6) 720);my test

(equal? (prime-accum? 1) #f)
(equal? (prime-accum? 2) #t)
(equal? (prime-accum? 3) #t)
(equal? (prime-accum? 6) #f)
(equal? (prime-accum? 42) #f)
(equal? (prime-accum? 61) #t)
(equal? (prime-accum? 41) #t); my test
