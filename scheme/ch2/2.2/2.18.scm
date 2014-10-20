; Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:


(define (reverse items)
    (define (loop items rev)
        (if (null? items)
            rev
            (loop (cdr items) (cons (car items) rev))))
    (loop items (list)))

(reverse (list 1 4 9 16 25))