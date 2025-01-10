;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname number_of_7_less_than_or_equal_273) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Prüft, ob eine 7er Zahl kleiner oder gleich als 273 ist.
(: number_of_7_less_than_or_equal_273? (number -> boolean))

; Testfälle
(check-expect (number_of_7_less_than_or_equal_273? 12) #f)
(check-expect (number_of_7_less_than_or_equal_273? 21) #t)
(check-expect (number_of_7_less_than_or_equal_273? 49) #t)
(check-expect (number_of_7_less_than_or_equal_273? 273) #t)
(check-expect (number_of_7_less_than_or_equal_273? 280) #f)

; Schreiben Sie hier die Hilfsfunktion number_of_7_less_than_or_equal_273?
(define number_of_7_less_than_or_equal_273?
  (lambda (num)
    (and (= (remainder num 7) 0) (<= num 273))))

; Listenfunktion, welche alle 7er Zahlen kleiner oder gleich als 273 filtert.
(: listenfilter_number_of_7_less_than_or_equal_273? ((list-of number) -> (list-of number)))

; Testfälle
(check-expect (listenfilter_number_of_7_less_than_or_equal_273? (list 28 84 96 103 105 114)) (list 28 84 105))
(check-expect (listenfilter_number_of_7_less_than_or_equal_273? (list 7 11 21 34 48 62 98)) (list 7 21 98))

; Listenfunktion listenfilter_number_of_7_less_than_or_equal_273?
(define listenfilter_number_of_7_less_than_or_equal_273?
  (lambda (lst)
    (filter (lambda (x) (number_of_7_less_than_or_equal_273? x)) lst)))

