;Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of 
;steps, as does fast-expt. 

(define (square n) (* n n))

(define (fast-expt b n)
    (cond
        ((= 0 n) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1)))))) 

(define (faster-expt b n)
    (define (iter a b n)
        (cond
            ((= n 0) a)
            ((even? n) (iter a (square b) (/ n 2)))
            (else (iter (* a b) b (- n 1)))))
    (iter 1 b n)) 