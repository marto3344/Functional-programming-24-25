#lang racket
(define (repeater str)
 (λ (count glue)
    (if (= count 1)
     str 
    (string-append str glue ((repeater str) (sub1 count) glue)))
  )
 )

(equal? ((repeater "I love Racket") 3 " ") "I love Racket I love Racket I love Racket")
(equal? ((repeater "Quack") 5 "!") "Quack!Quack!Quack!Quack!Quack")
(equal? ((repeater "Procedural programming is better than FP!") 2 " ") "Procedural programming is better than FP! Procedural programming is better than FP!");my test