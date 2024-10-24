#lang racket
(define (count-digits n)
  (if(< n 10)
     1
     (add1 (count-digits (quotient n 10)))
  )
 )
(define (sub-num? x y)
  (define (helper? leftover x-len)
     (and (>= leftover x) (or (= x (remainder leftover (expt 10 x-len))) (helper? (quotient leftover 10) x-len))); Eto veche ne vrushtam explicitno true/false :)
    )
  (and (<= x y) (helper? y (count-digits x)))
  )


(equal? (sub-num? 123 5123783) #t)
(equal? (sub-num? 0 0) #t)
(equal? (sub-num? 10 101) #t)
(equal? (sub-num? 101 101) #t)
(equal? (sub-num? 10 0) #f)
(equal? (sub-num? 1253 5123783) #f)
(equal? (sub-num? 12 0) #f)
(equal? (sub-num? 512 5123783) #t); my test