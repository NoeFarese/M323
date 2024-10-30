;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Untitled) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Aufgabe 4.2
; Enum for carbohydrate
(define carbohydrate
(signature (one-of "Brot" "Toast" "Teigwaren" "Reis" "Kartoffelstock" "Pommes Frites")))
 
; Enum for vegetables
(define vegetables
(signature (one-of "Bohnen" "Romanesco" "Blumenkohl" "Gurken" "Erbsen" "Brokkoli")))
 
; Enum for meat
(define meat
(signature (one-of "Schinken" "Rindsfleich" "Lachs" "Salami" "Kotlett" "Hähnchen")))

; breakfast Record
(define-record breakfast
  make-breakfast
  breakfast?
  (carbohydrate_breakfast carbohydrate)
  (vegetable_breakfast vegetables)
  (meat_breakfast meat)
  )

; instanz von breakfast
(define b1 (make-breakfast "Brot" "Bohnen" "Schinken"))
(define b2 (make-breakfast "Toast" "Gurken" "Lachs"))

; Lunch Record
(define-record lunch
  make-lunch
  lunch?
  (carbohydrate_lunch carbohydrate)
  (vegetable_lunch vegetables)
  (meat_lunch meat)
  )

; instanz von lunch
(define l1 (make-lunch "Teigwaren" "Erbsen" "Hähnchen"))
(define l2 (make-lunch "Reis" "Brokkoli" "Lachs"))

; dinner Record
(define-record dinner
  make-dinner
  dinner?
  (carbohydrate_dinner carbohydrate)
  (vegetable_dinner vegetables)
  (meat_dinner meat)
  )

; instanz von dinner
(define d1 (make-dinner "Pommes Frites" "Blumenkohl" "Kotlett"))
(define d2 (make-dinner "Kartoffelstock" "Bohnen" "Salami"))
                        
; ein essen kann ein breakfast, ein lunch oder ein dinner sein
(define food
  (signature (mixed breakfast lunch dinner)))


; holt gemüse von morgessen
(: get-vegetable-from-breakfast (breakfast -> vegetables))
(define get-vegetable-from-breakfast
  (lambda(b)
    (vegetable_breakfast b)
  ))

;holt gemüse von mittagessen
(: get-vegetable-from-lunch (lunch -> vegetables))
(define get-vegetable-from-lunch
  (lambda (l)
     (vegetable_lunch l)
  ))

; holt gemüse von abendessen
(: get-vegetable-from-dinner (dinner -> vegetables))
(define get-vegetable-from-dinner
  (lambda (d)
    (vegetable_dinner d)
  ))  

; Gemüse von food bekommen
(: get-vegetable-from-food (food -> vegetables))
(define get-vegetable-from-food
  (lambda (f)
    (cond
      ((breakfast? f) (get-vegetable-from-breakfast f))
      ((lunch? f) (vegetable_lunch f))
      ((dinner? f) (vegetable_dinner f))
    )))

(check-expect (get-vegetable-from-breakfast b1) "Bohnen")
(check-expect (get-vegetable-from-breakfast b2) "Gurken")
(check-expect (get-vegetable-from-lunch l1) "Erbsen")
(check-expect (get-vegetable-from-lunch l2) "Brokkoli")
(check-expect (get-vegetable-from-dinner d1) "Blumenkohl")
(check-expect (get-vegetable-from-dinner d2) "Bohnen")

(check-expect (get-vegetable-from-food b1) "Bohnen")
(check-expect (get-vegetable-from-food b2) "Gurken")
(check-expect (get-vegetable-from-food l1) "Erbsen")
(check-expect (get-vegetable-from-food l2) "Brokkoli")
(check-expect (get-vegetable-from-food d1) "Blumenkohl")
(check-expect (get-vegetable-from-food d2) "Bohnen")
