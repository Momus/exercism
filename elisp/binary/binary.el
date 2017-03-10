;;; binary.el --- Binary exercise (exercism)

;;; Commentary:
;; If anyone is looking at my other submissions, they may notice I
;; reach for the Common Lisp loop _a_lot_.  But so far, it seems the
;; most efficient and readable way to go.

;;; Code:
(defun to-decimal (int-str)
  "Convert INT-STR to corresponding base 10 integer."
  (let ((exp-size (- (length int-str) 1)))
   (loop for c
              from 0 to exp-size
              sum (* (case (aref int-str c)
                       (48 0)
                       (49 1)
                       (otherwise 0))
                     (expt 2 (- exp-size c))))))

(provide 'binary)
;;; binary.el ends here
