;Modify the make-account procedure of exercise 3.3 by adding another local state variable so that, 
;if an account is accessed more than seven consecutive times with an incorrect password, 
;it invokes the procedure call-the-cops.

(define (call-the-cops) (lambda () "Calling the cops"))

(define (make-account balance password)
    (define wrong-attempts 0)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (define (dispatch p m)
        (cond 
            ((not (eq? p password)) 
                (if (> wrong-attempts 7)
                    (call-the-cops)
                    (begin
                        (set! wrong-attempts (+ wrong-attempts 1))
                        (lambda () "incorrect password"))))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (display "Unknown request -- MAKE-ACCOUNT"))))
    dispatch)