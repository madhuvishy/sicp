;Coin changing algorithm: 
(defn denom [coin]
  (cond
    (= coin 1) 1
    (= coin 2) 5
    (= coin 3) 10
    (= coin 4) 25
    (= coin 5) 50
  )
)

(defn cc [amount coins]
  (cond 
    (= amount 0) 1
    (or (< amount 0) (= coins 0)) 0
    :else (+ (cc amount (dec coins))
             (cc (- amount (denom coins)) coins)
          )
  )
) 

(defn coin-change [amount]
  (cc amount 5))

