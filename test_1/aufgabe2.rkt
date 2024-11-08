;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname aufgabe2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; konstante a
(: a number)
(define a 3)

; hilsfunktion welche zahl quadriert
(: squaring (number -> number))

(check-expect (squaring 3) 9)
(check-expect (squaring 5) 25)
(check-expect (squaring 0) 0)

(define squaring
  (lambda (x)
    (* x x)))

; funktion welche den zurückgelegten weg während der beschleunigung berechnet
(: acceleration (number -> number))

(check-expect (acceleration 0) 0)
(check-expect (acceleration 2) 6)
(check-expect (acceleration 4) 24)

(define acceleration
  (lambda (t)
    (* 0.5 a (squaring t))))