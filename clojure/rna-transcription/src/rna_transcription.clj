(ns rna-transcription)

(def dna-to-rna (hash-map
                 :G 'C'
                 :C 'G'
                 :T 'A'
                 :A 'U'
                 )
  
  )


(defn transcribe
  [strand transcription-map]
  (map #( %1 ;;REM: %1 is the hash map
         )
       strand)
)





(defn to-rna
  "Given a strning of uppercase letters A--G return the same type of
  string where the letters correspond to the RNA complement."
  [strand] 


  (def comp "A")
  comp
)
