;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:
(require 'cl)
(require 'dash)

(defun pling (str num)
  "Take a STR and a NUM and pling!"
  (if (zerop (% num 3))
      (concat str "Pling") str))

(defun plang (str num)
  "Take a STR and a NUM and plang!"
  (if (zerop (% num 5))
    (concat str "Plang") str))

(defun plong (str num)
  "Take a STR and a NUM and plong!"
  (if (zerop (% num 7))
      (concat str "Plong") str))

(defun drop (str num)
  "Dropps the message of STR and NUM."
  (if (equal "" str) (number-to-string num) str))


(defmacro rain (word num str)
  "Add WORD to STR if NUM is MAGIC."
  (list 'if '(zerop (% num '4))
        '(concat str word) 'str))

(setq w "word")
(setq m 3)
(setq n 6)
(setq s "string")
(macroexpand (rain w n s))

(defmacro inc (var)
  "Example with VAR."
  (list 'setq var (list '1+ var)))

(macroexpand (inc n))
(print n)
(setq var (1+ var))


(setq var x)
(setq x 5) (print x)
(inc x)


(defun convert (num)
  "Convert integer NUM to its raindrops string."
  (-> ""
       (pling num)
       (plang num)
       (plong num)
       (drop num)))

(provide 'raindrops)
;;; raindrops.el ends here

(concat "x" "y")

(set 'flowers '(rose violet daisy buttercup))
(print flowers) (rose violet daisy buttercup)
(quote flowers)

