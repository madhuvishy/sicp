#|
Fill in the missing expressions to complete the following definitions of some basic list-manipulation operations as accumulations:

(define (map p sequence)
  (accumulate (lambda (x y) <??>) nil sequence))
(define (append seq1 seq2)
  (accumulate cons <??> <??>))
(define (length sequence)
  (accumulate <??> 0 sequence))

|#

(define nil '())
(define (inc x) (+ x 1))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))
            
(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))
    
(define (length sequence)
    (accumulate (lambda (x y) (inc y)) 0 sequence))

;(map square '(1 2 3))
;(append (list 1 2 3) (list 4 5 6))
;(length (list 1 2 3 4 5 6 7 8 9 20))