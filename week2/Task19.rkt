#lang racket
;(require math/number-theory)
(define (double-fact-odd n)
   (if(= n 1)
    1
    (* n (double-fact-odd (- n 2)))
   )
  )
(define (calc-series-sum x n)
  (if (zero? n)
   -2
   (+ (/ (*(expt -2 (add1 n)) (expt x n))
       (double-fact-odd (add1 (* 2 n))))
     (calc-series-sum x (sub1 n))  
  )
)
)

(calc-series-sum 1 0) ; -2
(calc-series-sum 1 1) ; -2/3
(calc-series-sum 1 2) ; -1 1/5
(calc-series-sum 1 3) ; -1 1/21
(calc-series-sum 1 4) ; -1 11/135
(calc-series-sum 1 5) ; -1 29/385
(calc-series-sum 1 6) ; -1 937/12285
(calc-series-sum 1 7); my test