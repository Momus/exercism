;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(defun **2 (x)
  "Square of X."
  (* x x))


(defun square-of-sums (x)
  "X is sqaure-summmed."
  (**2 (cl-loop for n
             from 1 to x
             sum n)))


(defun sum-of-squares (x)
  "X sum-squared."
  (cl-loop for n
           from 1 to x
           sum (**2 n)))


(defun difference (x)
  "X differed."
  (- (square-of-sums x)
     (sum-of-sqaures x)))


(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
