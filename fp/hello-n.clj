; Tuesday 30 July 2013
(fn[n]
    (loop [i 0]
          (when (< i n)
                (println "Hello World")
                (recur (inc i)))))
