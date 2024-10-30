;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname p83_aufgabe_2.11) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
(: punkte-konsequenz (integer -> string))

(define punkte-konsequenz
  (lambda (punkte)
    (cond
      ((= punkte 0) "Keine Sanktionen")
      ((<= punkte 3) "Vormerkung")
      ((<= punkte 5) "Ermahnung")
      ((<= punkte 7) "Verwarnung")
      ((= punkte 8) "Entzug")
      (else "Ungültige Punktezahl"))))

(check-expect (punkte-konsequenz 0) "Keine Sanktionen")
(check-expect (punkte-konsequenz 2) "Vormerkung")
(check-expect (punkte-konsequenz 5) "Ermahnung")
(check-expect (punkte-konsequenz 7) "Verwarnung")
(check-expect (punkte-konsequenz 8) "Entzug")
(check-expect (punkte-konsequenz 10) "Ungültige Punktezahl")