;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname odd-numbers-list) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
; Ungerade Elemente einer Liste herausfiltern
(define list-of-number
  (signature (mixed empty-list cons-of-number)))

(define-record empty-list
  make-empty 
  empty?) 

(define empty (make-empty))

(define-record cons-of-number
  cons
  cons?
  (first number)
  (rest list-of-number))

(: odds (list-of-number -> list-of-number))

(define list (cons 2 (cons 3 (cons 5 (cons 10 empty)))))

(define odds
  (lambda (list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (odds (rest list)))
       (if (odd? f)
           (cons f r)
           r)))))

(check-expect (odds empty) empty) 
(check-expect (odds list) (cons 3 (cons 5 empty)))
(check-expect (odds (cons 1 empty)) (cons 1 empty))
(check-expect (odds (cons 2 empty)) empty)
(check-expect (odds (cons 7 (cons 8 empty))) (cons 7 empty))