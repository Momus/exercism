(ns reverse-string)

(defn reverse-string [string]
  (if (empty? string)
    ""
    (reduce #(str %2 %1 ) string)))
