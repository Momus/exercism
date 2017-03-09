;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

;(require 'cl)

(cl-defun hamming-distance (strand-1 strand-2)
  "Number of characters by which STRAND-1 differs from STRAND-2."
  (if (not (equal (length strand-1) (length strand-2)))
      (signal 'error '("Strand Lengths Are Not Equal!"))
    (cl-loop for position
         from 0 to (- (length strand-1) 1)
         sum (if (equal (aref strand-1 position)
                        (aref strand-2 position))
                 0
               1))))

(provide 'hamming)
;;; hamming.el ends here
