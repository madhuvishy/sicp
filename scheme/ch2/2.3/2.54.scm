#|
Two lists are said to be equal? if they contain equal elements arranged in the same order. For example,

(equal? '(this is a list) '(this is a list))

is true, but

(equal? '(this is a list) '(this (is a) list))

is false. To be more precise, we can define equal? recursively in terms of the basic eq? equality of symbols 
by saying that a and b are equal? if they are both symbols and the symbols are eq?, 
or if they are both lists such that (car a) is equal? to (car b) and (cdr a) is equal? to (cdr b). 
Using this idea, implement equal? as a procedure.

|#

(define (equal? l1 l2)
    (cond 
        ((and (not (pair? l1)) (not (pair? l2))) 
            (eq? l1 l2))
        ((and (pair? l1) (pair? l2))
            (and (equal? (car l1) (car l2))
                 (equal? (cdr l1) (cdr l2))))
        (else #f)))