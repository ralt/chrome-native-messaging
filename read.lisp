(in-package #:chrome-native-messaging)

(defun read-from-ext (stream)
  "Reads the string sent from the extension. The stream is usually *standard-input*."
  (let ((length (read-length stream)))
    (read-stdin-as-string stream length)))

(defun read-stdin-as-string (stream length)
  "Helper function to read *standard-input* as a string"
  (format
   nil
   "~{~C~}"
   (mapcar
    #'code-char
    (loop for c from 1 to length
       collect (read-byte stream)))))

(defun read-length (stream)
  "Reads the length of the message from the first 4 bytes"
  (+
   (read-byte stream)
   (* (read-byte stream) (expt 2 8))
   (* (read-byte stream) (expt 2 16))
   (* (read-byte stream) (expt 2 24))))
