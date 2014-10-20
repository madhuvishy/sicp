;All these need accumalate and accumalate-n so putting them together

(define nil '())
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

;2.36
(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init 
                (accumulate (lambda (x y) (cons (car x) y)) nil seqs))
            (accumulate-n op init 
                (accumulate (lambda (x y) (cons (cdr x) y)) nil seqs)))))
                    
;(accumulate-n + 0 s)

;2.37
(define v (list 3 4 5))
(define w (list 7 8 9))
(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define n (list (list 2 3 4) (list 5 6 7) (list 8 9 10)))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))
 
(define (matrix-dot-vector m v)
    (map (lambda (x) (dot-product v x)) m))
    
(define (transpose m)
    (accumulate-n cons nil m))
    
(define (matrix-cross-matrix m n)
    (let ((ncols (transpose n)))
        (map (lambda (mrow) (matrix-dot-vector ncols mrow)) m)))
        
;2.38 
(define fold-right accumulate)
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

;2.39

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))
(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

;2.40

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
  
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))
        
(define (unique-pairs n)
    (flatmap (lambda (i)
            (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))
    
;2.41
(define (is-matching-sum? sum triple)
    (= (accumulate + 0 triple) sum))

(define (triples n)
    (let ((interval (enumerate-interval 1 n)))
        (flatmap (lambda (i)
                    (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                            interval))
                        interval))
                    interval)))

(define (filter-triples n sum)
    (filter (lambda (triple) (is-matching-sum? sum triple)) (triples n)))
    