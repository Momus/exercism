(ns run-length-encoding)

(defn encoder [char last_char counter]
  "the basic building block of encoding"
  (if (= char last_char)
    '()
    ())
  )



(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  )

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  )
