;Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:

(define (last-pair elements)
    (let ((items (cdr elements)))
        (if (null? items)
            elements
            (last-pair (cdr elements)))))

(last-pair (list 23 72 149 34))
