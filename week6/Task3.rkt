#lang racket
(define (graph-contains-points points f)
   (andmap (λ (x) (equal? (f (car x)) (cdr x))) points)
  )


(equal? (graph-contains-points '((1 . 2) (2 . 3) (3 . 4)) add1) #t)
(equal? (graph-contains-points '((1 . 2) (2 . 4) (3 . 4)) add1) #f)
(equal? (graph-contains-points '((1 . "11") (2 . "21") (3 . "31")) (λ (x) (string-append (number->string x) "1"))) #t)
