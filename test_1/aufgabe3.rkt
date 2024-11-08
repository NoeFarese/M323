;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname aufgabe3) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Ein Wochentag ist eines der folgenden:
(define weekdays
  (signature (one-of "Mo" "Di" "Mi" "Do" "Fr")))

; Eine Raumreservierung hat folgende Eigenschaften:
; - Name des Raumes
; - Wochentag
; Uhrzeit
; Name des Dozenten
(define-record slot
  make-slot
  slot?
  (slot-room string)
  (slot-day weekdays)
  (slot-time number)
  (slot-lecturer string))
 
; Funktion reserve reserviert Raum fall's er noch nicht belegt wurde und gibt einen neuen Eintrag zurück, sonst gibt es den
; vorhandenen Eintrag zurück
(: reserve (slot string -> slot))

(check-expect (reserve (make-slot "Raum A" "Mo" 10 "") "Dr. Schmidt")
              (make-slot "Raum A" "Mo" 10 "Dr. Schmidt"))
(check-expect (reserve (make-slot "Raum A" "Di" 12 "Dr. Meyer") "Dr. Schmidt")
              (make-slot "Raum A" "Di" 12 "Dr. Meyer"))
(check-expect (reserve (make-slot "Raum B" "Mi" 15 "") "Dr. Müller")
              (make-slot "Raum B" "Mi" 15 "Dr. Müller"))
(check-expect (reserve (make-slot "Raum C" "Do" 9 "Dr. Lehmann") "Dr. Müller")
              (make-slot "Raum C" "Do" 9 "Dr. Lehmann"))


(define reserve
  (lambda (slot new-lecturer)
    (if (string=? (slot-lecturer slot) "")
        (make-slot (slot-room slot)
                   (slot-day slot)
                   (slot-time slot)
                   new-lecturer)
        slot)))



   