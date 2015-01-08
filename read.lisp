(in-package #:chrome-native-messaging)

(defun read-from-ext (stream)
  "Reads the string sent from the extension. The stream is usually *standard-input*."
  (handler-case
      (let ((length (read-length stream)))
	(read-stdin-as-string stream length))
    ; When no byte is available, it means the communication is cut off.
    (end-of-file () nil)))

(defun read-stdin-as-string (stream length)
  "Helper function to read *standard-input* as a string"
  (let ((string (make-string length)))
    (read-sequence string stream)
    string))

(defun read-length (stream)
  "Reads the length of the message from the first 4 bytes"
  (+
   (read-byte stream)
   (* (read-byte stream) (expt 2 8))
   (* (read-byte stream) (expt 2 16))
   (* (read-byte stream) (expt 2 24))))
