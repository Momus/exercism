;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:
(defun leap-year-p (year)
  "Return t if YEAR is a leap year."
  (if (= (mod year 400) 0)
      t
    (if (and (/= (mod year 100) 0)
             (= (mod year 4) 0))
        t
      nil)))

(provide 'leap)
;;; leap.el ends here
