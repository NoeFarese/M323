;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Zusammengesetzte-Daten) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; zusammengesetzte Daten
; besteht aus / hat folgende Eigenschaften

; Eine Uhrzeit besteht aus:
; - Stunde
; - Minute

(define-record time
  make-time ; Konstruktor
  (time-hour   natural) ; Selektoren + Signatur
  (time-minute natural))

(: make-time (natural natural -> time))
(: time-hour (time -> natural))
(: time-minute (time -> natural))

(define t1 (make-time 12 24)) ; Durch diese Daten werden 12 Uhr 24 dargestellt.
(define t2 (make-time 7 00)) ; 7 Uhr
(define t3 (make-time 23 55)) ; fünf vor Zwölf

; Mituten seit Mitternacht berechnen
(: minutes-since-midnight (time -> natural))

(check-expect (minutes-since-midnight t1) ; Statt den Taschenrechner zu verwenden, hier ausrechnen!
              (+ (* 12 60) 24))
(check-expect (minutes-since-midnight t2)
              (* 7 60))
(check-expect (minutes-since-midnight t3)
              (+ (* 23 60) 55))

(define minutes-since-midnight
  (lambda (time)
    (+ (* (time-hour time) 60)
    (time-minute time))))


; aus den Minuten seit Mitternacht die Uhrzeit berechnen
(: msm->time (natural -> time))

(check-expect (msm->time (+ (* 12 60) 24))
                         t1)
(check-expect (msm->time (* 7 60))
                         t2)
(check-expect (msm->time (+ (* 23 60) 55))
                         t3)

(define msm->time
  (lambda (msm)
    (make-time (quotient msm 60)
               (modulo msm 60))))

; Ein Gürteltier hat folgende Eigenschaften:
; - lebendig oder tot?
; - Gewicht in Gramm
(define-record dillo
  make-dillo
  (dillo-alive? boolean)
  (dillo-g natural))

(: make-dillo (boolean natural -> dillo))
(: dillo-alive? (dillo -> boolean))
(: dillo-g (dillo -> natural))

(define dillo1 (make-dillo #t 20000))
(define dillo2 (make-dillo #f 15000))

; Gürteltier überfahren
(: run-over-dillo (dillo -> dillo))

#|
objektorientiert:
class Dillo
...
def runOverDillo(self):
  self.alive = False
  ...
Das Gürteltier wird genommen und ein Teil wird verändert,
so dass das Gürteltier nicht mehr das Gleiche ist wie vorher.
|#

(check-expect (run-over-dillo dillo1) (make-dillo #f 20000))
(check-expect (run-over-dillo dillo2) dillo2)

(define run-over-dillo
  (lambda (dillo)
    (make-dillo #f (dillo-g dillo))))