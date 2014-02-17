;Finding the nth Fibonacci number

;Recursive procedure, Tree Recursive process 

(defn fib-rec [n] 
  (if (< n 2) 
    n 
    (+ (fib (- n 1)) (fib (- n 2)))
  )
)

;Recursive procedure, Linear Iterative process

(defn fib-iter[a b count] 
  (if (= count 0)
    a            
    (fib-iter b (+ a b) (dec count))
  )
)

(defn fib[n] 
  (fib-iter 0 1 n)
)
