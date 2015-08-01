;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:


(provide 'bob)

(defun shouting-p (shout-string)
  " Blackadder:: Tell me, do you ever stop shouting at the lower orders?
    Duke of Wellington: NEVER! There's only one way to win a campaign: SHOUT, SHOUT AND SHOUT AGAIN!
    Blackadder: You don't think inspired leadership and tactical ability has anything to do with it?
    Duke of Wellington: (pause) NO! It's all down to shouting! BAAAH!"
  (equal (upcase string) shout-string)
  )

(defun question-p (quest-string)
  "Checking for interrogation"
  (string-match-p "\?$" quest-string ))


(defun bob (&optional bob-string)
  "Say something stupid, get something stupid"
  (if bob-string ((if (shouting-p bob-string)
                      (message "Whoa, chill out!")
                    (if question-p bob-string (message "Sure")
                        (message "Whatever."))
                    ))
    (message "Fine. Be that way!")
    )
  )


;;; bob.el ends here
