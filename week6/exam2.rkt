#lang racket
(define (shuffle-merge xs ys)
  (define (helper ps qs results turn?)
    (cond
       [(null? ps) (append results qs)]
       [(null? qs) (append results ps)]
       [turn? (helper (cdr ps) qs (append results (list (car ps))) #f)]
       [else (helper ps (cdr qs) (append results (list (car qs))) #t)]
      )
    )
   (helper xs ys '() #t)
  )

(define (shuffle-merge-2 xs ys)
  (define (helper ps qs turn?)
    (cond
       [(null? ps) qs]
       [(null? qs) ps]
       [turn?  (cons  (car ps) (helper (cdr ps)  qs #f))]
       [else  (cons  (car qs) (helper ps (cdr qs) #t ))]
      )
    )
   (helper xs ys  #t)
  )
(equal? (shuffle-merge-2 '(1) '()) '(1))
(equal? (shuffle-merge-2 '(3 4 5) '(2)) '(3 2 4 5)) 
(equal? (shuffle-merge-2 '(3 4 5) '(9 2)) '(3 9 4 2 5)) 
(equal? (shuffle-merge-2 '(3 2 8) '(5 6 1 9 11)) '(3 5 2 6 8 1 9 11)) 
