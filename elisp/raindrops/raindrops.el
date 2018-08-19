;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:
(require 'cl)

(defun convert (num)
  "Convert integer NUM to its raindrops string."
  (let ((outstring ""))
    (progn (when (zerop (% num 3)) (setf outstring (concat  outstring "Pling")))
           (when (zerop (% num 5)) (setf outstring (concat  outstring "Plang")))
           (when (zerop (% num 7)) (setf outstring (concat  outstring "Plong")))
           (if (equal "" outstring) (number-to-string num) outstring))))

(provide 'raindrops)
;;; raindrops.el ends here
