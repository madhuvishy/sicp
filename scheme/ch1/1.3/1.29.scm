#|

Simpson's Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson's Rule, the integral of a function f between a and b is approximated as

http://mitpress.mit.edu/sicp/full-text/book/ch1-Z-G-29.gif

where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above.

|#

(define (cube x) (* x x x))
(define (square x) (* x x))
(define (inc n) (+ n 1))

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))
        


(define (simp-sum f a b n)
    (define h (/ (- b a) n))
    (define (yk k) (f (+ a (* k h))))
    (define (term k) (* (yk k)
                        (cond ((or (= k 0) (= k (- n 1))) 1)
                              ((even? k) 2)
                              (else 4))))
    (* (/ h 3) (sum term 0 inc n)))