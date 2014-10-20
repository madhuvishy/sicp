#|

Modify fixed-point so that it prints the sequence of approximations it generates, 
using the newline and display primitives shown in exercise 1.22. 
Then find a solution to xx = 1000 by finding a fixed point of x   log(1000)/log(x). 
(Use Scheme's primitive log procedure, which computes natural logarithms.) 
Compare the number of steps this takes with and without average damping. 
(Note that you cannot start fixed-point with a guess of 1, 
as this would cause division by log(1) = 0.)

|#

(define (avg x y) (/ (+ x y) 2))
(define (inc n) (+ 1 n))
(define (square x) (* x x))

(define tolerance 0.000001)

(define (report val)
    (newline)
    (display val))
    
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (report guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))
    
;(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)