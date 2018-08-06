;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:
(defun two-fer (&optional twoname)
  "The two-fer function using TWONAME."
  (concat "One for " (or twoname "you") ", one for me."))

(provide 'two-fer)
;;; two-fer.el ends here
