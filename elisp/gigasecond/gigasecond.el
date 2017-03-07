;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:

;;Taking the "functional approach": only constants, no side
;;effects. (Except \\[setenv] below.)
(defconst gigasecond-giga (expt 10 9))

;; Not messing with time zones in this namespace.
(setenv "TZ" "UTC0")


(defun from (second minute hour day month year)
  "Add a gigasecond to SECOND MINUTE HOUR DAY MONTH YEAR."
  (let ((date (encode-time second minute hour day month year)))
    (subseq (-> date
                (time-to-seconds)
                (+ gigasecond-giga)
                (seconds-to-time)
                (decode-time))
            0 6)))


(provide 'gigasecond)
;;; gigasecond.el ends here
