;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:

;;; Code:
(defun translate (nucleotide-map nucleotide)
  "Return correct analogue from NUCLEOTIDE-MAP for given NUCLEOTIDE."
  (let ((translated  (lax-plist-get nucleotide-map nucleotide)))
    (if (null translated) (error "Not on map")
      translated)))

(defun transcribe (nucleotide-map template-strand &optional output-strand)
  "Transcribe TEMPLATE-STRAND, adding to OUTPUT-STRAND, according to NUCLEOTIDE-MAP."
  (if (string-blank-p template-strand)
      output-strand
    (transcribe nucleotide-map
                (substring template-strand 1)
                (concat output-strand (translate
                                       nucleotide-map (substring template-strand 0 1))))))

(defun to-rna (nucleotide-strand)
  "Return a string containing to NUCLEOTIDE-STRAND."
  (let ((dna-to-rna '("G" "C"
                      "C" "G"
                      "T" "A"
                      "A" "U")))
    (transcribe dna-to-rna nucleotide-strand)))


(provide 'rna-transcription)
;;; rna-transcription.el ends here
