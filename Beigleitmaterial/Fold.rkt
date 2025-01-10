;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Fold) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; ----- Funktionen auf Listen -----

(define list-of-number (signature (list-of number)))

; Beispiele
(define list0 empty) ; leere Liste
(define list1 (cons 17 empty)) ; Eine einelementige Liste: 17 (+ empty)
(define list2 (cons 5 (cons 17 empty))) ; Eine 2elementige Liste: 5 17
(define list3 (cons 3 list2)) ; Eine 3elementige Liste: 3 5 17

; ---- Funktionen, welche von den Listen konsumieren ----

; Summe der Elemente einer Liste berechnen
(: list-sum (list-of-number -> number))

; Testfälle
(check-expect (list-sum list0) 0)
(check-expect (list-sum list1) 17)
(check-expect (list-sum list2) 22)
(check-expect (list-sum list3) 25)

(define list-sum
  (lambda (list)
    (cond
      ((empty? list) 0)
      ((cons? list)
       (+ (first list)
          (list-sum (rest list)))
       ))))

; Produkt der Elemente einer Liste
(: list-product (list-of-number -> number))

; Testfälle
(check-expect (list-product list0) 1)
(check-expect (list-product list1) 17)
(check-expect (list-product list2) 85)
(check-expect (list-product list3) 255)

(define list-product
  (lambda (list)
    (cond
      ((empty? list) 1)
      ((cons? list)
       (* (first list)
          (list-product (rest list)))))))

; ----- Fold -----

; Liste einfalten
(: list-fold (%b (%a %b -> %b) (list-of %a) -> %b))

; Grundsätzlicher Aufbau der Signatur (Eine Funktion mit 3 Eingaben):
; (: list-fold (... ... ... -> ...))

; Die dritte Eingabe ist eine Liste:
; (: list-fold (... ... (list-of ...) -> ...))

; for-cons ist eine zweistellige Funktion:
; (: list-fold (... (... ... -> ...) (list-of ...) -> ...))

; Die Listenelemente können beliebig sein:
; (: list-fold (... (... ... -> ...) (list-of %a) -> ...))

; for-cons nimmt Elemente der Liste entgegen:
; (: list-fold (... (%a ... -> ...) (list-of %a) -> ...))

; Der Gesamtergebnistyp ist noch offen:
; (: list-fold (... (%a ... -> ...) (list-of %a) -> %b))

; Beim rekursiven Aufruf sehen wir, dass das Gesamtergebnis %b in die zweite Stelle der Funktion for-cons hineingeht:
; (: list-fold (... (%a %b -> ...) (list-of %a) -> %b))

; Das Ergebnis von for-cons muss das gleiche sein wie das Gesamtergebnis:
; (: list-fold (... (%a %b -> %b) (list-of %a) -> %b))

; Die leere Liste muss der gleiche Datentyp sein, wie das Gesamtergebnis:
; (: list-fold (%b (%a %b -> %b) (list-of %a) -> %b))
; In der als Parameter übergebenen Funktion wird ein Listenelement mit dem Gesamtergebnis verrechnet und damit zum neuen Gesamtergebnis.

(check-expect (list-fold 0 + (list 1 2 3 4 5)) 15)
(check-expect (list-fold 1 * (list 1 2 3 4 5)) 120)

(define list-fold
  (lambda (for-empty for-cons list) ; Die neuen Variablen müssen den Parameter hinzugefügt werden!
    (cond
      ((empty? list) for-empty) ; Die 0 oder 1 sind im empty-Zweig, daher for-empty!
      ((cons? list)
       (for-cons (first list) ; Die * oder + sind im cons-Zweig, daher for-cons!
                 (list-fold for-empty for-cons (rest list))))))) ; Ebenso gehören Sie in den rekursiven Aufruf.


; list-fold entspricht der Schablone:
; Für eine Liste braucht es ein "cond", "(empty? list)", "(cons? list)", "first list)" und der rekursive Aufruf.
; Was passiert mit der leeren Liste? Das ist von Funktion zu Funktion unterschiedlich. --> for-empty
; Die zweite Sache, die unterschiedlich ist was mit dem ersten Element gemacht wird, sowie wie mithilfe des rekursiven Aufrufs der restlichen Elemente das Gesamterggebnis gebildet wird. --> for-cons
; list-fold ist die Manifestation des Patterns für Listenfunktionen.
; Probieren Sie folgendes aus: (list-fold empty cons (list 1 2 3 4 5 6)) --> Identität (Also list.fold entspricht den Rückrad der Liste)

; ----- Aufgaben -----

; Aufgabe 1:
; Abstrahieren Sie list-map mithilfe von list-fold.
; Erstellen Sie also die Listenfunktion list-map2, indem Sie dazu list-fold verwenden.

; Bemerkungen:
; for-empty wird bei list-map zu empty.

; for-cons ist eine zweistellige Funktion. Also schreiben wir "lambda (... ...)"
; In diese Funktion gehen das erste Element der Liste und das Ergebnis des nächsten rekusiven Aufrufs: "lambda (first-list rec)"
; In list-map steht:
; (cons --> cons (Wichtig, weil jedes Teilergebnis zu einem Listenelement wird.)
;    (f (first list)) --> (f first-list)
;    (list-map f (rest list))) --> rec
; Jetzt fehl noch die dritte Parameter, die Liste

; Funktion auf alle Elemente einer Liste anwenden.
(: list-map2 ((%a -> %b) (list-of %a) -> (list-of %b)))

(define list-map2
  (lambda (f list)
    (list-fold empty
               (lambda (first-list rec)
                 (cons
                  (f first-list)
                  rec))
               list)))


; Probieren wir es aus:

(define inc
  (lambda (n)
    (+ 1 n)))

(check-expect (list-map2 inc (list 1 2 3 4 5)) (list 2 3 4 5 6))
