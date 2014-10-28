#|
2.68
The encode procedure takes as arguments a message and a tree and produces the list of bits that gives the encoded message.

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

Encode-symbol is a procedure, which you must write, 
that returns the list of bits that encodes a given symbol according to a given tree. 
You should design encode-symbol so that it signals an error if the symbol is not in the tree at all. 
Test your procedure by encoding the result you obtained in exercise 2.67 with the sample tree
and seeing whether it is the same as the original sample message.

2.69
The following procedure takes as its argument a list of symbol-frequency pairs 
(where no symbol appears in more than one pair) and generates a Huffman encoding tree according to the Huffman algorithm.

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
|#

(define true #t)
(define false #f)

(define (element-of-set? x set) 
    (cond 
        ((null? set) false) 
        ((equal? x (car set)) true) 
        (else (element-of-set? x (cdr set))))) 
        
(define (make-leaf symbol weight)
    (list 'leaf symbol weight))
(define (leaf? object)
    (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))


(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
      
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))



(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))


(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))
                    
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;2.68
(define (encode-symbol symbol tree)
    (define (correct-branch? s branch)
        (if (leaf? branch)
            (equal? (symbol-leaf branch) s)
            (element-of-set? symbol (symbols branch))))

    (let ((lb (left-branch tree))
          (rb (right-branch tree)))
        (cond 
            ((correct-branch? symbol lb)
                (if (leaf? lb) '(0) (cons 0 (encode-symbol symbol lb))))
            ((correct-branch? symbol rb)
                (if (leaf? rb) '(1) (cons 1 (encode-symbol symbol rb))))
            (else
                (error "bad symbol " symbol)))))

;2.69

(define (successive-merge leaf-set)
    (if (null? (cdr leaf-set))
        (car leaf-set)
        (successive-merge (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set))
                                      (cddr leaf-set)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))











(define sample-tree 
    (make-code-tree (make-leaf 'A 4) 
                    (make-code-tree 
                    (make-leaf 'B 2) 
                    (make-code-tree (make-leaf 'D 1) 
                                    (make-leaf 'C 1)))))

(encode '(A D A B B C A) sample-tree) 