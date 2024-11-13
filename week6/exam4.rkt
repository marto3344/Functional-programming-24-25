#lang racket

(define (find-column xs)
  (define (helper result ys)
    (cond
     [(null? ys) -1]
     [(= (car ys) 1) result]
     [else (helper (add1 result) (cdr ys))]
     )
    )
  (helper 1 xs)
  )

(define (find-pos rows)
   (define (helper row xs)
     (let ([one-pos (find-column (car xs))])
        (cond
        [(null? xs) (error "Matrix does not contain 1")]
        [(positive? one-pos) (cons row one-pos)]
        [else (helper (add1 row) (cdr xs))]
       )
       )
     )
   (helper 1 rows)

  )

(define (steps-bm rows)
   (let ([position (find-pos rows)])
      (+ (abs (- (car position) 3)) (abs (- (cdr position) 3)))
     )
  )

(= (steps-bm '((0 0 0 0 0)
(0 0 0 0 1)
(0 0 0 0 0)
(0 0 0 0 0)
(0 0 0 0 0)) ) 3); → 3
(= (steps-bm '((0 0 0 0 0)
(0 0 0 0 0)
(0 1 0 0 0)
(0 0 0 0 0)
(0 0 0 0 0)) ) 1) ; → 1
(= (steps-bm '((0 0 0 0 0)
(0 0 0 0 0)
(0 0 1 0 0)
(0 0 0 0 0)
(0 0 0 0 0)) ) 0) ; → 0
(= (steps-bm '((0 0 0 0 0)
(0 0 0 0 0)
(0 0 0 0 0)
(0 0 0 0 0)
(0 0 0 0 1)) ) 4) ; → 4