;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:
(defun leap-year-p (year)
  "Return t if YEAR is a leap year."
  (or (zerop (mod year 400))
      (and (not (zerop(mod year 100)))
            (zerop (mod year 4)))))


(provide 'leap)
;;; leap.el ends here
