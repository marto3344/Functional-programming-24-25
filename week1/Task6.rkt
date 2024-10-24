#lang racket
(define (leap-year-one-line? year)
  (or(zero? (remainder year 400)) (and (zero? (remainder year 4))(not (zero?(remainder year 100)))));Honestly what is this syntax!? :'(
  )

 (define (leap-year-guards? year)

   (cond
      [(negative? year)(error "year has to be non-negative") ]
      [(zero? (remainder year 400)) #t]
      [(zero? (remainder year 100)) #f]
      [(zero? (remainder year 4)) #t]
      [ else #f]

     )
   )

(equal? (leap-year-one-line? 2020) #t)
(equal? (leap-year-one-line? 1988) #t)
(equal? (leap-year-one-line? 1600) #t)
(equal? (leap-year-one-line? 2400) #t)
(equal? (leap-year-one-line? 2023) #f)
(equal? (leap-year-one-line? 1700) #f)
(equal? (leap-year-one-line? 1800) #f)
(equal? (leap-year-one-line? 2100) #f)
(equal? (leap-year-one-line? 2024) #t);my test

(equal? (leap-year-guards? 2020) #t)
(equal? (leap-year-guards? 1988) #t)
(equal? (leap-year-guards? 1600) #t)
(equal? (leap-year-guards? 2400) #t)
(equal? (leap-year-guards? 2023) #f)
(equal? (leap-year-guards? 1700) #f)
(equal? (leap-year-guards? 1800) #f)
(equal? (leap-year-guards? 2100) #f)
(equal? (leap-year-one-line? 2023) #f);my test