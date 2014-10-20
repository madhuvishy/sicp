#|
a.  The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures. Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to  using the formula


b.  If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.
|#

(define (product-i term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (fact n)
    (product identity 1 inc n))

(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
            (product term (next a) next b))))
            
(define (walls-pi x)
    (define (term n) (if (even? n) 
                            (/ (+ n 2) (+ n 1)) 
                            (/ (+ n 1) (+ n 2))))
    (* 4 (product-i term 1 inc x)))