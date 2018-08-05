;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:
(defun two-fer (&optional twoname)
"The two-fer function using TWONAME."
(if twoname (concat "One for " twoname ", one for me.")
  '"One for you, one for me."))

(provide 'two-fer)
;;; two-fer.el ends here
