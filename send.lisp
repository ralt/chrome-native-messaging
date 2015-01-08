(in-package #:chrome-native-messaging)

(defun send-to-ext (string output-stream)
  "Sends a string to the extension. Usually, output-stream is *standard-output*."
  (let ((len (length string)))
    (dolist (byte (integer-to-bytes len))
      (write-byte byte output-stream))
    (dolist (byte (coerce string 'list))
      (write-byte (char-code byte) output-stream)))
  (force-output output-stream))

(defun integer-to-bytes (integer)
  (list
   (logand integer #xFF)
   (logand (ash integer -8) #xFF)
   (logand (ash integer -16) #xFF)
   (logand (ash integer -24) #xFF)))
