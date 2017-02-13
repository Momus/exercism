(ns hello-world)


(defn hello
  ([]
   (hello "World"))
  
  ([greet-name]
   (str "Hello, " greet-name "!")))
