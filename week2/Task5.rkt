#lang racket
(require math/number-theory)
(define (amicable? a b)
  (=(divisor-sum a)(divisor-sum b))
)
(equal? (amicable? 200 300) #f)
(equal? (amicable? 220 284) #t)
(equal? (amicable? 284 220) #t)
(equal? (amicable? 1184 1210) #t)
(equal? (amicable? 2620 2924) #t)
(equal? (amicable? 6232 6368) #t)
(equal? (amicable? 300 200) #f);my test