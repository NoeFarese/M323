;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname p53_aufgabe_2.1) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Seite 53, Aufgabe 2.1

; (: xor (boolean -> boolean))
(define xor
  (lambda (e1 e2)
    (cond
      ; Wenn e1 und e2 beide true sind, ergibt XOR false.
      [(and e1 e2) #f]
      ; Wenn e1 und e2 beide false sind, ergibt XOR false.
      [(and (not e1) (not e2)) #f]
      ; Wenn einer von beiden true ist, ergibt XOR true.
      [else #t])))

(check-expect (xor #t #t) #f) ; #f weil beide true
(check-expect (xor #f #t) #t) ; #t weil einer true
(check-expect (xor #t #f) #t) ; #t weil einer true
(check-expect (xor #f #f) #f) ; #f weil beide false              