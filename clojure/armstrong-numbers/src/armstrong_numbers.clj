(ns armstrong-numbers)

(defn exp
  "Raise X to power N."
  [x n]
  (loop [acc 1
         n n]
    (if (zero? n) acc
        (recur (* x acc) (dec n)))))

(defn char-to-int
  "Convert a CHAR symbolizing a digit to that digit."
  [char]
  (case char
    \0 0
    \1 1
    \2 2
    \3 3
    \4 4
    \5 5
    \6 6
    \7 7
    \8 8
    \9 9 ))

(defn armstrong
  "Convert NUM into its Armstrong numeral."
  [num]
  (let [numseq   (map char-to-int (seq (str num)))
        powerseq (repeat (count numseq) (count numseq))]
    (reduce + (map exp numseq powerseq))))

(defn armstrong?
  "Test if NUM is an Armstrong Number."
  [num] (= num (armstrong num)))
