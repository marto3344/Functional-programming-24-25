#lang racket
(define (my-list-ref xs index)
   (define (helper ys i)
     (if (zero? i)
       (car ys)
       (helper (cdr ys) (sub1 i))
      )
    )
   (if (or (negative? index) (>= index (length xs)))
     (error "error: Invalid index!")
     (helper xs index)
   )
  )

(= (my-list-ref '(1 2 3) 0) 1)
(= (my-list-ref '(1 2 3) 1) 2)
(equal? (my-list-ref '("Hello" 2 ("nested list")) 0) "Hello")
(equal? (my-list-ref '("Hello" 2 ("nested list")) 2) '("nested list"));my test
(my-list-ref '(1 2 3) -100) ; error: Invalid index!
