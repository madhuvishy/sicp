;Implement the union-set operation for the unordered-list representation of sets.

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))
        

(define (union-set set1 set2)
    (cond 
        ((and (null? set1) (not (null? set2))) set2)
        ((and (null? set2) (not (null? set1))) set1)
        ((element-of-set? (car set1) set2)
            (union-set (cdr set1) set2))
        (else (cons (car set1)
                    (union-set (cdr set1) set2)))))