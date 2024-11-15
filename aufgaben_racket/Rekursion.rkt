;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Rekursion) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
(: product-upto (number -> number))
; 1. Funktion: Berechnung des Produkts von 1 bis n
(define product-upto
  (lambda (n)
    (if (= n 1)
        1
        (* n (product-upto (- n 1))))))

(check-expect (product-upto 1) 1)
(check-expect (product-upto 5) 120)
(check-expect (product-upto 6) 720)

(: sum-upto (number -> number))
; 2. Funktion: Berechnung der Summe von 1 bis n
(define sum-upto
  (lambda (n)
    (if (= n 0)
        0
        (+ n (sum-upto (- n 1))))))

(check-expect (sum-upto 0) 0)
(check-expect (sum-upto 5) 15)
(check-expect (sum-upto 10) 55)

; (: variation (number number -> number))
; 3. Funktion: Berechnung der Variationen (Reihenfolge ist wichtig)
(define variation
  (lambda (total k)
    (if (= k 0)
        1
        (* total (variation (- total 1) (- k 1))))))

(check-expect (variation 10 3) 720) ; 10 * 9 * 8
(check-expect (variation 5 2) 20)

; (: combination (number number -> number))
; 4. Funktion: Berechnung von Kombinationen (Reihenfolge ist nicht wichtig)
(define combination
  (lambda (n k)
    (if (or (= k 0) (= k n))
        1
        (+ (combination (- n 1) (- k 1))
           (combination (- n 1) k)))))

(check-expect (combination 42 6) 5245786)
(check-expect (combination 5 2) 10)
(check-expect (combination 6 6) 1)
