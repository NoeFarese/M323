;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname p97_aufgabe_3.3) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp")))))
(define minutes-since-midnight->wallclock-time
  (lambda (msm)
    (string-append 
      (number->string (quotient msm 60)) ":"
      (number->string (remainder msm 60)))))

(check-expect (minutes-since-midnight->wallclock-time (+ (* 11 60) 55)) "11:55")
(check-expect (minutes-since-midnight->wallclock-time 0) "0:0")
(check-expect (minutes-since-midnight->wallclock-time 61) "1:1")

; Funktion zur Umwandlung einer Uhrzeit im 24-Stunden-Format ins 12-Stunden-Format
(define convert-to-12-hour-format
  (lambda (hours minutes)
    (string-append 
      (number->string 
        (if (or (= hours 0) (= hours 12))
            12
            (remainder hours 12)))
      ":"
      (if (< minutes 10)
          (string-append "0" (number->string minutes))
          (number->string minutes))
      " "
      (if (< hours 12) "AM" "PM"))))

(check-expect (convert-to-12-hour-format 23 45) "11:45 PM")
(check-expect (convert-to-12-hour-format 0 0) "12:00 AM")
(check-expect (convert-to-12-hour-format 12 0) "12:00 PM")
(check-expect (convert-to-12-hour-format 11 59) "11:59 AM")
(check-expect (convert-to-12-hour-format 13 1) "1:01 PM")