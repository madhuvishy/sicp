;Recursive procedure, Linear Recursive process

(defn fact-rec [n] 
  (if (= n 1) 
    n 
    (* n (fact-rec (- n 1)))
  )
)

;Recursive procedure, Linear Iterative process
(defn fact-iter [prod count limit] 
  (if (> count limit) 
    prod  
    (fact-iter (* prod count) (inc count) limit)
  )
)

(defn fact [n] 
  (fact-iter 1 1 n)
)
