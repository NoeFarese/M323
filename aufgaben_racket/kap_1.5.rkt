;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname kap_1.5) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; -----------------Kapitel 1.5 - ABSTRAKTION UND APPLIKATION-----------------

; lambda functions
(define s1 (square 40 "solid" "red"))
(define p1 (star-polygon 20 10 3 "solid" "blue"))

(define tile
  (lambda (a b)
   (above
    (beside a b)
    (beside b a))))

(tile s1 p1)