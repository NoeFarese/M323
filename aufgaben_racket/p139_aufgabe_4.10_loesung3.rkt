;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname p139_aufgabe_4.10_loesung3) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Kapitel 4.4 - Aufgabe 4.10 - Lösung 3

; Steigung einer Gerade berechnen
(: slope (real real real real -> (mixed real string)))

(check-expect (slope 0 0 1 1) 1)
(check-expect (slope 0 0 2 1) 1/2)
(check-expect (slope 1 2 3 5) 3/2)
(check-expect (slope 0 0 0 1) "no slope")

(define slope
  (lambda (x1 y1 x2 y2)
    (if (= (- x2 x1) 0)
        "no slope"
        (/ (- y2 y1)
           (- x2 x1)))))