(defn func-rec [n]
  (cond (< n 3) n
        :else (+ (func-rec (dec n))
                 (* (func-rec (- n 2)) 2)
                 (* (func-rec (- n 3)) 3)
              )
  )
)
