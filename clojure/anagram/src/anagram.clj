(ns anagram)


(use '[clojure.string :only (lower-case)])


(defn anagram?
  [one two]
  (let [low-one  (lower-case one)
        low-two  (lower-case two)]
    (and (not= low-one low-two)
         (= (frequencies low-one)
            (frequencies low-two)))))


(defn anagrams-for
  [word possible-anagrams]
  (do
    (def anagram-of? (partial anagram? word))
    (filter anagram-of? possible-anagrams)))
