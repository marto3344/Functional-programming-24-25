#lang racket
(define (growing-plant up-speed down-speed desired-height)
   (define (calculate-days total-days current-height up-speed down-speed desired-height)
       (if(>=(+ current-height up-speed) desired-height)
          (+ total-days 1)
          (calculate-days (+ total-days 1) (+ current-height (- up-speed down-speed)) up-speed down-speed  desired-height))    
     )  
   (cond
      [(<= up-speed 0)(error "up-speed must be greater than zero")]
      [(negative? down-speed)(error "down-speed must be non-negative")]
      [(< up-speed down-speed)(error "up-speed must be greater than down speed")]
      [(negative? desired-height)(error "Desired height must be non-negative")]
      [else (calculate-days 0 0 up-speed down-speed desired-height)]
     )
  )
(= (growing-plant 5 2 5) 1)
(= (growing-plant 5 2 6) 2)
(= (growing-plant 10 9 4) 1)
(= (growing-plant 100 10 910) 10) ; up-speed=100, down-speed=10, desired-height=910
(=(growing-plant 100 20 200)3);my test 