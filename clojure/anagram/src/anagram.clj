(ns anagram)


(use '[clojure.string :only (lower-case)])


(defn anagram?
  [one two]
  (let [low_one  (lower-case one)
        low_two  (lower-case two)]
    (and (not= low_one low_two)
         (= (frequencies low_one)
            (frequencies low_two)))))


(defn anagrams-for
  [word possible-anagrams]
  (do
    (def anagram-of? (partial anagram? word))
    (filter anagram-of? possible-anagrams)))
