;;; bob.el --- Bob exercise (exercise)

;;; Commentary:

;;; Code:

(defun nuthin-p (mutter-string)
  "Better to stay silent and be thought a fool ..."
  (if (null (string-match-p "[a-z0-9A-Z]" mutter-string))
      t
    nil
    )
  )

(defun shout-p (shout-string)        
  "It's all down to shouting! BAAAHH"
   (and (string-match-p "[a-zA-Z]+" shout-string)  (equal (upcase shout-string) shout-string) )
  )


 (defun whuh-p (quest-string)
   "A question is anything you want with a bang at the end."
   (string-match-p "\?$" quest-string )
   )


(defun response-for (&optional bob-string)
  "Say something stupid, get something stupid"

  (let  ;This is Bob's vocab
      ((b-shout "Whoa, chill out!")
       (b-whuh  "Sure.")
       (b-nuthin "Fine. Be that way!")
       (b-generic "Whatever.")
       )
    
    (cond ; Let body is what he does with it
     ((nuthin-p bob-string) (message b-nuthin))
     ((shout-p bob-string) (message b-shout))
     ((whuh-p bob-string) (message b-whuh))
     ((message b-generic))
     )
    )
  )


(provide 'bob)

;;; bob.el ends here
