;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:
(defun etl (legacy-table)
  "Convert a LEGACY-TABLE style scrabble table to 'shiney, new' system."
  (
   ))


(provide 'etl)
;;; etl.el ends here

(hash-table-keys mixed-case-expected) ("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" ...)
(hash-table-keys mixed-case-input) (1 2 3 4 5 8 10)
(gethash '3 mixed-case-input) ("B" "c" "M" "P")
(gethash '"j" mixed-case-expected) nil
