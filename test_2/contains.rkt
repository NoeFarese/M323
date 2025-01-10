;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname contains) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Element in einer Liste enthalten?
(:  contains? ( %a (list-of %a) -> boolean))

; Testfälle
(check-expect (contains? 1 (list 1 2 3 4 5)) #t)
(check-expect (contains? 5 (list 1 2 3 4 5))  #t)
(check-expect (contains? 6 (list 1 2 3 4 5))  #f)
(check-expect (contains? "Hallo" (list "Test" "DrRacket" "Hallo" "Donnerstag"))  #t)
(check-expect (contains? #t (list #f #f #t #t #f))  #t)

; Schreiben Sie hier die Definition von contains
(define contains?
  (lambda (element lst)
    (fold (lambda (x acc) (or (= x element) acc)) #f lst)))