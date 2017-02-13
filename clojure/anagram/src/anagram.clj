(ns anagram)


(use '[clojure.string :only (split lower-case)])


 (defn anagrams-for [word possible-anagrams] 
  (do
    (def word-freq (frequencies (lower-case word)))
    (loop [[next-word & other-words] possible-anagrams
           outlist [] ]
      (if (empty? next-word)
        outlist
        (do
          (def target (lower-case next-word))
          (if (and (= (frequencies target) word-freq)
                   (not= target (lower-case word)))
            (recur (into [] other-words) (conj outlist next-word) )
            (recur (into [] other-words) outlist)))))))
