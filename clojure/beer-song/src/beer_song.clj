(ns beer-song)


(defn verse
  ([]
   (verse 99))
  
  ([number]
  (case number
    0
    (str "No more bottles of beer on the wall, no more bottles of beer.\n"
         "Go to the store and buy some more, 99 bottles of beer on the wall.\n")
    
    1
    (str "1 bottle of beer on the wall, 1 bottle of beer.\n"
         "Take it down and pass it around, no more bottles of beer on the wall.\n")

    2
    (str "2 bottles of beer on the wall, 2 bottles of beer.\n"
         "Take one down and pass it around, 1 bottle of beer on the wall.\n")
    
    (str number " bottles of beer on the wall, " number " bottles of beer.\n"
         "Take one down and pass it around, " (dec number)" bottles of beer on the wall.\n"))))


(defn sing
  ([]
   (sing 99))
  
  ([top]
   (sing top 0))
  
  ([top bottom]
   (loop [counter top
          song "" ] 
     (if  (< counter (+ bottom 1))
       (str song (verse bottom))
       (recur (dec counter) (str song (verse counter) "\n"))))))
