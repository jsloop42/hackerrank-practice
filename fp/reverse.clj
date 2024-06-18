; Reverse a list without using reverse.
; Monday 29 July 2013
(fn [v]
  (loop [len (- (.count v) 1)]
    (when (>= len 0)
      (println (nth v len))
      (recur (- len 1)))))
