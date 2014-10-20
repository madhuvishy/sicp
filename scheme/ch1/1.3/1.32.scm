#|
a. Show that sum and product (exercise 1.31) are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:

(accumulate combiner null-value term a next b)

Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.

b. If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.
|#

(define (inc n) (+ n 1))

(define (accumalate combiner null-value term a next b)
    (if (> a b) 
        null-value
        (combiner (term a)
                  (accumalate combiner null-value term (next a) next b))))

(define (accumalate-i combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))
                  
(define (sum term a next b) 
    (accumalate + 0 term a next b))
    
(define (product term a next b) 
    (accumalate-i * 1 term a next b))