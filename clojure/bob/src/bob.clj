(ns bob)

(defn response-for
  "Returns the proper response form Bob."
  [statement]
  ;; This map is not really necessary, but it does seperate out data
  ;; and code, and lets me play with Clojure maps.
  (def bob-dict (hash-map :question "Sure."
                          :yell "Whoa, chill out!"
                          :blank "Fine. Be that way!"
                          :allelse "Whatever."
                          ))
  
  (cond
    (and (not (re-find #"[a-z]" statement))
         (re-find #"[A-Z]" statement))
    (bob-dict :yell)
    
    (re-find #"\?$"  statement)
    (bob-dict :question)
    
    (not (re-find #"[\S]" statement))
    (bob-dict :blank)

    :else (bob-dict :allelse)))
