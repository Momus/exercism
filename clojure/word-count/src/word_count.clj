;;;; Word Count

;;; Input: String

;;; Output: Hash map whose keys are all the "words" in the string and
;;; whose values are the frequency of their occurrance

;;; A word is a sequence of digit or number characters separated by
;;; any other category of characters.
(ns word-count)


(use '[clojure.string :only (lower-case)])


(defn insert-into-dictionary
  [word dictionary]
  (cond
    (empty? word)
    dictionary

    (dictionary word)
    (update-in dictionary [word] inc)

    :else (assoc dictionary word 1)))

(defn dr-johnson
  "Makes a dictionary.  If passed an alphanumeric character, it
  returns same dictionary, adds charecter to the end of the
  word. Otherwise adds the word to the dictionary if there is one, and
  returns the dictionary with an empty string."
  [dictionary
   word
   letter]
  (cond
    (or (Character/isLetter letter)
        (Character/isDigit letter))
    [dictionary (lower-case(str word letter))]

    (empty? word)
    [dictionary ""]

    :else
    [(insert-into-dictionary word dictionary) ""] ))


(defn word-count
  "From a String, return a hash-map whose keys are words, and values
  the frequency of their occurrence. "
  [phrase]
  (loop [[letter & rest-of-phrase] phrase
         dictionary {}
         word ""
         ]
    (if (nil? letter)
      (insert-into-dictionary (lower-case word) dictionary)
      
      (let [[new-dictionary new-word]
            (dr-johnson dictionary word letter)] 
        (recur rest-of-phrase
               new-dictionary
               new-word)))))
