;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname p84_aufgabe_2.14) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
(: nummer->position (natural -> string))

(define nummer->position
  (lambda (nummer)
    (cond
      ((= nummer 1) "Torwärtin")
      ((<= nummer 5) "Abwehrspielerin")
      ((or (<= nummer 8) (= nummer 10)) "Mittelfeldspielerin")
      ((or (= nummer 9) (= nummer 11)) "Stürmerin")
      ((and (>= nummer 12) (<= nummer 99)) "Ersatzspielerin")
      (else "Ungültige Nummer"))))

(check-expect (nummer->position 1) "Torwärtin")
(check-expect (nummer->position 4) "Abwehrspielerin")
(check-expect (nummer->position 7) "Mittelfeldspielerin")
(check-expect (nummer->position 9) "Stürmerin")
(check-expect (nummer->position 15) "Ersatzspielerin")
(check-expect (nummer->position 100) "Ungültige Nummer")