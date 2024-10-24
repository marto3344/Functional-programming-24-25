#lang racket
(define (can-carry? item-count capacity item-weight)
  (cond
    [(negative? item-count) (error "Items count must be non-negative")]
    [(negative? capacity) (error "bag capacity must be non-negative")]
    [(negative? item-weight) (error "Weight of each item can't be less than zeron")]
    [else (<= (* item-weight item-count) capacity)]
    )
  )



(equal? (can-carry? 5 15 3) #t)
(equal? (can-carry? 1 5 4) #t)
(equal? (can-carry? 13 25 2) #f)
(equal? (can-carry? 24 104.44 21.12) #f)
(equal? (can-carry? 51 34.75 19.852) #f)
(equal? (can-carry? 42 95.11 0.51) #t)
(equal? (can-carry? 33 100.99 3) #t);my test