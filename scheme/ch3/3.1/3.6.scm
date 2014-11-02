#|
It is useful to be able to reset a random-number generator to produce a sequence starting from a given value. 
Design a new rand procedure that is called with an argument that is either the symbol generate or the symbol reset and 
behaves as follows: (rand 'generate) produces a new random number 
((rand 'reset) <new-value>) resets the internal state variable to the designated <new-value>. 
Thus, by resetting the state, one can generate repeatable sequences. These are very handy to have when testing and 
debugging programs that use random numbers.
|#

(define (rand action)
    (let ((rnum (random 1000)))
        (cond 
            ((eq? action 'generate) rnum)
            ((eq? action 'reset) 
                (lambda (x) (set! rnum x) rnum)))))

#|
Test:

1 ]=> (rand 'generate)

;Value: 653

1 ]=> ((rand 'reset) 5)

;Value: 5
|#