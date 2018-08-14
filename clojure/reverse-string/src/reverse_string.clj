(ns reverse-string)

(defn reverse-string [string]
  (loop [acc ""
         strcoll (seq string)]
    (if (empty? strcoll)
      acc
      (recur (str (first strcoll) acc)
             (rest strcoll)))))
