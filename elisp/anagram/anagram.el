;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:
(defun anagramp (word-1 word-2)
  "True if WORD-1 is an anagram of WORD-2."
  (let ((w1 (downcase word-1))
        (w2 (downcase word-2)))
    (and (not (equal w1 w2))
         (equal (cl-sort w1 '<)
                (cl-sort w2 '<)))))


(defun anagrams-for (word word-list)
  "List of all the anagrams of WORD contained in WORD-LIST."
  (cl-remove-if-not (apply-partially 'anagramp word)
                    word-list))

(provide 'anagram)
;;; anagram.el ends here
