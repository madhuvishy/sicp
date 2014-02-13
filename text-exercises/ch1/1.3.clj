(defn square [x] (* x x))

(defn sum-of-squares [a b] (+ (square a) (square b)))

(defn sum-of-larger-squares [a b c]
   (if (= (min a b c) a) (sum-of-squares b c)
       (if (= (min a b c) b) (sum-of-squares a c)
           (if (= (min a b c) c) (sum-of-squares a b)))))

