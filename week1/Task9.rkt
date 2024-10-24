#lang racket
(define (snail desired-height up-speed down-speed )
  
   (define (calculate-days total-days current-height up-speed down-speed desired-height)
       (if(>= (+ current-height up-speed) desired-height)
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
(= (snail 3 2 1) 2)
(= (snail 10 3 1) 5)
(= (snail 10 3 2) 8)
(= (snail 100 20 5) 7)
(= (snail 5 10 3) 1)
(=(snail 150 100 20 )2);my test 