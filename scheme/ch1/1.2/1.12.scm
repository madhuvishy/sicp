;The following pattern of numbers is called Pascal's triangle.
;The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. 
;Write a procedure that computes elements of Pascal's triangle by means of a recursive process.

(define (pascal row col)
    (cond
        ((or (> col row) (< col 0)) 0)
        ((= col 1) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))