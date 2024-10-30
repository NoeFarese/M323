;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname aufgabe_4.2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
(define carbohydrate
(signature (one-of "Brot" "Toast" "Teigwaren" "Reis" "Kartoffelstock" "Pommes Frites") ) )

(define vegetables
(signature (one-of "Bohnen" "Romanesco" "Blumenkohl" "Gurken" "Erbsen" "Brokkoli") ))

(define meat
(signature (one-of "Schinken" "Rindsfleich" "Lachs" "Salami" "Kotlett" "Hänchen") ) )

(define food
  (signature (mixed breakfast
                    lunch
                    dinner)))

(define-record breakfast
  make-breakfast
  breakfast?
  (carbohydrate_breakfast carbohydrate)
  (vegetable_breakfast vegetables)
  (meat_breakfast meat))


(define-record lunch
  make-lunch
  lunch?
  (carbohydrate_lunch carbohydrate)
  (vegetable_lunch vegetables)
  (meat_lunch meat))


(define-record dinner
  make-dinner
  dinner?
  (carbohydrate_dinner carbohydrate)
  (vegetablese_dinner vegetables)
  (meat_dinner meat))


(: get-vegetable-from-food (food -> vegetables))

(check-expect (get-vegetable-from-food (make-breakfast "Brot" "Erbsen" "Schinken")) "Erbsen")
(check-expect (get-vegetable-from-food (make-breakfast "Toast" "Romanesco" "Salami")) "Romanesco")
(check-expect (get-vegetable-from-food (make-lunch "Toast" "Brokkoli" "Schinken")) "Brokkoli")
(check-expect (get-vegetable-from-food (make-lunch "Toast" "Brokkoli" "Schinken")) "Brokkoli")
(check-expect (get-vegetable-from-food (make-dinner "Brot" "Blumenkohl" "Schinken")) "Blumenkohl")
(check-expect (get-vegetable-from-food (make-dinner "Toast" "Erbsen" "Salami")) "Erbsen")


(define get-vegetable-from-food
  (lambda (f)
    (cond
      ((lunch? f) (vegetable_lunch f))
      ((dinner? f) (vegetablese_dinner f))
      ((breakfast? f) (vegetable_breakfast f))
      )))
