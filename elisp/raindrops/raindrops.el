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

(defun convert (num)
  "Convert integer N to its raindrops string."
  (let ((outstring "baa"))
    (progn (when (zerop (% n 3)) (concat  "Pling" outstring))
     (when (zerop (% n 5)) (concat  "Plang" outstring))
     (when (zerop (% n 7)) (concat  "Plong" outstring))
     )
    outstring))

(convert 7)





(defun wtf (n)
  (let ((stx "xx"))
    (progn (when (= (% n 3)) (concat stx "Pling"))
     (when (= (% n 5)) (concat stx "Plang")))))

(% 6 3)

(wtf 3)

(defun drop-test ())

(provide 'raindrops)
;;; raindrops.el ends here



(emptyp "")

(let ((a 3)) (+ a 1))
