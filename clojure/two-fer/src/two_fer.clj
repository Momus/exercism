(ns two-fer)

(defn two-fer
  "Return 'One for you, one for me' if no argument is provided, 'One
  for NAME, one for me.' if passed a string"
  ([]
   (two-fer "you"))
  ([name]
   (str "One for " name ", one for me.")))
