(asdf:defsystem #:chrome-native-messaging
  :description "A package to communicate with a Chrome extension as the native application"
  :author "Florian Margaine <florian@margaine.com>"
  :license "MIT License"
  :serial t
  :depends-on ("trivial-utf-8")
  :components ((:file "package")
               (:file "read")
               (:file "send")))
