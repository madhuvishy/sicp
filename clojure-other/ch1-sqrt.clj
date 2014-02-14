; Newton's sqrt algorithm discussed in the book. 

(defn square [x] (* x x))

(defn abs [x] (if (< x 0) (- x) x))

(defn good-enough? [guess x] (if (< (abs (- (square guess) x)) 0.1) true))

(defn improve [guess x] (float (/ (+ guess (/ x guess)) 2)))

(defn try-sqrt [guess x] (if (good-enough? guess x) guess (recur (improve guess x) x)))

(defn sqrt [x] (try-sqrt 1 x))
