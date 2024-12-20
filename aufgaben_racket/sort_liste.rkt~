;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname sort_liste) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
(define list-of-number
  (signature (mixed empty-list cons-of-number)))

(define-record empty-list
  make-empty 
  empty?)

; konstante für leere liste
(define empty (make-empty))

(define-record cons-of-number
  cons
  cons?
  (first number)
  (rest list-of-number))



(: delete-once (number list-of-number -> list-of-number))

(check-expect (delete-once 5 (cons 1 (cons 2 (cons 5 (cons 3 (cons 4 (cons 5 empty))))))) 
              (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty))))))
(check-expect (delete-once 7 (cons 1 (cons 2 (cons 3 empty)))) 
              (cons 1 (cons 2 (cons 3 empty))))

(define delete-once
  (lambda (n list)
    (cond
      ((empty? list) empty)
      ((cons? list)
       (define f (first list))
       (define r (rest list))
       (if (= f n)
           r
           (cons f (delete-once n r)))))))


(: list-min (list-of-number -> number))

(check-expect (list-min (cons 5 (cons 3 (cons 7 (cons 1 empty))))) 1)
(check-expect (list-min (cons 8 (cons 6 (cons 7 empty)))) 6)

(define list-min
  (lambda (list)
    (cond
      ((empty? (rest list)) (first list))
      (else
       (define f (first list))
       (define r (list-min (rest list)))
       (if (< f r) f r)))))

(: sort (list-of-number -> list-of-number))

(check-expect (sort (cons 5 (cons 3 (cons 7 (cons 1 (cons 4 empty)))))) 
              (cons 1 (cons 3 (cons 4 (cons 5 (cons 7 empty))))))
(check-expect (sort (cons 8 (cons 6 (cons 7 empty)))) 
              (cons 6 (cons 7 (cons 8 empty))))

(define sort
  (lambda (list)
    (cond
      ((empty? list) empty)
      (else
       (define m (list-min list))
       (cons m (sort (delete-once m list)))))))
