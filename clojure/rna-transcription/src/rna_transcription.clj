(ns rna-transcription)


(def dna-to-rna (hash-map
                 "G"  "C"
                 "C"  "G"
                 "T"  "A"
                 "A"  "U"
                 ))


(defn transcribe
  [strand transcription-map]
  (->> strand
   (map
   #(if-let [nucleotide (get transcription-map (str %1))]
      nucleotide
      (throw (AssertionError.))))
   clojure.string/join))


(defn to-rna
  "Given a strning of uppercase letters A--G return the same type of
  string where the letters correspond to the RNA complement."
  [strand] 
  (transcribe strand dna-to-rna))
