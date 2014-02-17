;Find number at position (row,col) on Pascal's triangle
(comment(
1
11
121
1331
14641))

(defn pascal-triangle [row col]
  (cond (> col row) 0
        (< col 0) 0
        (= col 1) 1
        :else (+ (pascal-triangle (dec row) (dec col))
                 (pascal-triangle (dec row) col))))
