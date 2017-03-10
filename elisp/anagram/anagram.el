;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:
(defun freq-map (word)
  "Break WORD up into a list of chars  then sort them."
  (sort (cl-loop for c
                 from 0 to (- (length word) 1)
                 collect (aref word c))
        '<))


(defun anagramp (word-1 word-2)
  "True if WORD-1 is an anagram of WORD-2."
  (and (not (equal word-1 word-2))
       (equal (freq-map (downcase word-1))
              (freq-map (downcase word-2)))))


(defun anagrams-for (word word-list)
  "List of all the anagrams of WORD contained in WORD-LIST."
  (cl-remove-if-not (apply-partially 'anagramp word)
                    word-list))

(provide 'anagram)
;;; anagram.el ends here
