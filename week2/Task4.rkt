#lang racket
(define (reverse n)
      (define (helper result leftover)
        (if (< leftover 10)
        (+ (* 10 result) leftover)
        (helper (+(* result 10) (remainder leftover 10)) (quotient leftover 10))
       )
      )
  (helper 0 (abs n))
)
(define (palindrome? n)
    (= (reverse  n) n)     
  )
(define (num-palindromes-rec a b)
    (define (helper begin end)
      (cond
        [(> begin end) 0]
        [(palindrome? begin) (add1 (helper (add1 begin) end))]
        [else (helper (add1 begin) end)]
      )
     )
  (helper (min a b) (max a b))
)

(define (num-palindromes-iter a b)
   (define (count-nums ptr end result)
    (cond
      [(> ptr end) result]
      [(palindrome? ptr)(count-nums (add1 ptr) end (add1 result))]
      [else (count-nums (add1 ptr) end result)]
      )
    )
    (count-nums (min a b) (max a b) 0)
  )
(= (num-palindromes-rec 1 101) 19)
(= (num-palindromes-rec 1 100) 18)
(= (num-palindromes-rec 100 1) 18)
(= (num-palindromes-rec -100 100) 19);my test

(= (num-palindromes-iter 1 101) 19)
(= (num-palindromes-iter 1 100) 18)
(= (num-palindromes-iter 100 1) 18)
(= (num-palindromes-iter -100 1) 2);my test