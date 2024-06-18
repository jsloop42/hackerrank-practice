;; 31 July 2013 12:04 AM
;; Given the number n, generate a vector [] with n numbers.
;; Eg: n = 3 => [1 2 3] or [1 1 1]
(fn [n]
  (into [] (take n (cycle (range n)))))
