(defn abs [x] (if (< x 0) (- x) x))

(defn square [x] (* x x))

(defn cube [x] (* x x x))

(defn good-enough-cuberoot? [guess x] (if (< (abs (- (cube guess) x)) 0.1) true))

(defn improve-cuberoot [guess x] (float(/ (+ (/ x (square guess)) (* 2 guess)) 3)))

(defn try-cbrt [guess x] (if (good-enough-cuberoot? guess x) guess (recur (improve-cuberoot guess x) x)))

(defn cbrt [x] (try-cbrt 1 x))
