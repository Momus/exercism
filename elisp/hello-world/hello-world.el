;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(defun hello (&optional hello-string)
  "Say what needs to be said."
  (if hello-string
      (message "Hello, %s!" hello-string)
    (message "Hello, World!"))
  )

(provide 'hello-world)

  
;;; hello-world.el ends here
