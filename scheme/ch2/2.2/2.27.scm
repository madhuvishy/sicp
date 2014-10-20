#|
Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well. For example,

(define x (list (list 1 2) (list 3 4)))

x
((1 2) (3 4))

(reverse x)
((3 4) (1 2))

(deep-reverse x)
((4 3) (2 1))

|#

(define (deep-reverse items)
    (define (drev items rev)
        (cond ((null? items) 
                rev)
              ((list? (car items)) 
                (drev (cdr items) (cons (drev (car items) nil) rev)))
              (else
                (drev (cdr items) (cons (car items) rev)))))
    (drev items nil))
                
;(deep-reverse (list 1 2 (list 3 (list 8 5)) 34 67 91 100 2 3 4))
