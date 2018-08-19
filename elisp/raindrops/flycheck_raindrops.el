;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'cl)


(defun drop-factor (n)
  "Factor number, N, to convert to raindrops."
  (let ((outvector [nil nil nil]))
    (cond ((zerop (% n 3)) (aset outvector 0 (/ n 3)))
          ((zerop (% n 7)) (aset outvector 1 (/ n 7)))
          )
    outvector))

(drop-factor 21)

(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((outstring ""))
    (if (zerop)))
  
  )



(provide 'raindrops)
;;; raindrops.el ends here



(emptyp "")

(let ((a 3)) (+ a 1))