  ;Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in 
  ;terms of adding, doubling, and halving and uses a logarithmic number of steps.

  (define (faster-mult a b)
    (define (iter acc a b)
        (cond 
            ((= b 0) acc)
            ((even? b) (iter acc (double a) (halve b)))
            (else (iter (+ acc a) a (- b 1)))))
    (iter 0 a b))