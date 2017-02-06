(ns rna-transcription)


(def dna-to-rna (hash-map
                 :G  "C"
                 :C  "G"
                 :T  "A"
                 :A  "U"
                 ))


(defn transcribe
  [strand transcription-map]
  (clojure.string/join
   (map
    #( if ((keyword (str %1)) transcription-map)
      ((keyword (str %1)) transcription-map)
      (throw (AssertionError.))
      )
    strand)))


(defn to-rna
  "Given a strning of uppercase letters A--G return the same type of
  string where the letters correspond to the RNA complement."
  [strand] 
  (transcribe strand dna-to-rna))
