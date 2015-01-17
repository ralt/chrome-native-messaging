(in-package #:chrome-native-messaging)

(defun read-from-ext (stream)
  "Reads the string sent from the extension. The stream is usually *standard-input*."
  (let ((length (read-length stream)))
    (trivial-utf-8:read-utf-8-string stream :byte-length length)))

(defun read-length (stream)
  "Reads the length of the message from the first 4 bytes"
  (+
   (read-byte stream)
   (* (read-byte stream) (expt 2 8))
   (* (read-byte stream) (expt 2 16))
   (* (read-byte stream) (expt 2 24))))
