;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname insert-sorted) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Wert (Zahl) in eine sortierte Liste einfügen
(: insert-sorted (%a (%a %a -> boolean) (list-of %a) -> (list-of %a)))

; Testfälle
(check-expect (insert-sorted 23 <= (list 3 12 45 113)) (list 3 12 23 45 113))
(check-expect (insert-sorted 25 <= empty) (list 25))
(check-expect (insert-sorted 23 >= (list 113 45 12 3)) (list 113 45 23 12 3))
(check-expect (insert-sorted 25 >= empty) (list 25))

; Schreiben Sie hier die Funktion "insert-sorted":
(define insert-sorted
  (lambda (value kriterium lst)
    (cond
      ((empty? lst) (list value))
      ((kriterium value (first lst)) (cons value lst))
      (else (cons (first lst) (insert-sorted value kriterium (rest lst)))))))