;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Gemischte-Daten) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Ein Tier ist eins der folgenden
; - ein Gürteltier
; - ein Papagei
; es handelt sich NICHT um eine Aufzählung
; gemischte Daten
(define animal
  (signature (mixed dillo parrot)))

; Ein Papagei hat folgende Eigenschaften:
; - ein Satz
; - Gewicht in g (Gramm)
(define-record parrot
  make-parrot ; Konstruktor
  parrot? ; Prädikat
  (parrot-sentence string)
  (parrot-g        natural))

(: parrot? (any -> boolean))

(define parrot1 (make-parrot "Der Schatz ist auf den Osterinseln!" 5000))
(define parrot2 (make-parrot "Guten Tag!" 3000))

;Papagei überfahren
(: run-over-parrot (parrot -> parrot))

(check-expect (run-over-parrot parrot1) (make-parrot "" 5000))
(check-expect (run-over-parrot parrot2) (make-parrot "" 3000))

(define run-over-parrot
  (lambda (parrot)
    (make-parrot "" (parrot-g parrot))))


; Ein Gürteltier hat folgende Eigenschaften:
; - lebendig oder tot?
; - Gewicht in Gramm
(define-record dillo
  make-dillo
  dillo?
  (dillo-alive? boolean)
  (dillo-g natural))

(: dillo? (any -> boolean))

(: make-dillo (boolean natural -> dillo))
(: dillo-alive? (dillo -> boolean))
(: dillo-g (dillo -> natural))

(define dillo1 (make-dillo #t 20000))
(define dillo2 (make-dillo #f 15000))

; Gürteltier überfahren
(: run-over-dillo (dillo -> dillo))

(check-expect (run-over-dillo dillo1) (make-dillo #f 20000))
(check-expect (run-over-dillo dillo2) dillo2)

(define run-over-dillo
  (lambda (dillo)
    (make-dillo #f (dillo-g dillo))))

; Tier überfahren
(: run-over-animal (animal -> animal))

(check-expect (run-over-animal dillo1)
              (run-over-dillo dillo1))
(check-expect (run-over-animal dillo2)
              (run-over-dillo dillo2))
(check-expect (run-over-animal parrot1)
              (run-over-parrot parrot1))
(check-expect (run-over-animal parrot2)
              (run-over-parrot parrot2))

(define run-over-animal
  (lambda (animal)
    (cond
      ((dillo? animal) (run-over-dillo animal))
      ((parrot? animal) (run-over-parrot animal)))))