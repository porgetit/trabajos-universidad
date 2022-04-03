#lang racket
(define (sumar n m)
  (if (< n m)
      (begin (+ n (sumar (+ n 1) m)))
      (begin n)
      )
  )

(define (sumab n m acumulador)
  (if (< n m)
      (begin (sumar (+ n 1) m (+ acumulador n)))
      (begin acumulador)
      )
  )

;(sumar 1 5) ; 15

(define (contar n m contador)
  (if (<= n m)
      (begin (contar (+ n 1) m (+ contador 1)))
      (begin contador)
      )
  )

;(contar 10 12 0) ;3

(define (promedio n m)
  (/ (sumar n m) (contar n m 0))
  )

;(promedio 1 5)

(define (promb n m acumulador contador)
  (if (<= n m)
      (begin (promb (+ n 1) m (+ acumulador n) (+ contador 1))
             )
      (begin
        (/ acumulador contador)
        )
      )
  )

;(promb 1 5 0 0) ; 3

(define (adivinar n m contador)
  (if (not (= n m))
      (begin
        (displayln m)
        (adivinar n (random 0 6) (+ contador 1))
        )
      (begin
        (displayln m)
        contador
        )
      )
  )

;(adivinar 4 (random 0 6) 1) ;10

(define (adivinarJuego n m contador)
  (if (not (= n m))
      (begin
        (displayln "No")
        (adivinarJuego n (read) (+ contador 1))
        )
      (begin
        (printf "Correcto, le tomó ~a intentos" contador)
        )
      )
  )

;(adivinarJuego (random 0 6) (read) 1)

(define (moneda tiros caras sellos)
  (if (< (+ caras sellos) tiros)
      (begin
        (if (= (random 0 2) 1)
            (begin (moneda tiros (+ caras 1) sellos))
            (begin (moneda tiros caras (+ sellos 1)))
            )
        )
      (begin
        (display "Caras ")(display caras)(display " Sellos ")(display sellos)
        )
      )
  )

;(moneda 10 0 0)

(define (moneda% tiros caras sellos)
  (if (< (+ caras sellos) tiros)
      (begin
        (if (= (random 0 2) 1)
            (begin (moneda% tiros (+ caras 1) sellos))
            (begin (moneda% tiros caras (+ sellos 1)))
            )
        )
      (begin
        (display "Caras ")(display caras)(display " Sellos ")(displayln sellos)
        (display "Caras ")(display (exact->inexact (* 100 (/ caras tiros))))(display "%")(display " Sellos ")(display (exact->inexact (* 100 (/ sellos tiros))))(display "%")
        )
      )
  )

;(moneda% 900000 0 0)

(define (dado tiros c1 c2 c3 c4 c5 c6 cara)
  (if (< (+ c1 c2 c3 c4 c5 c6) tiros)
      (begin
        (cond
          ((= cara 1) (dado tiros (+ c1 1) c2 c3 c4 c5 c6 (random 1 7)))
          ((= cara 2) (dado tiros c1 (+ c2 1) c3 c4 c5 c6 (random 1 7)))
          ((= cara 3) (dado tiros c1 c2 (+ c3 1) c4 c5 c6 (random 1 7)))
          ((= cara 4) (dado tiros c1 c2 c3 (+ c4 1) c5 c6 (random 1 7)))
          ((= cara 5) (dado tiros c1 c2 c3 c4 (+ c5 1) c6 (random 1 7)))
          ((= cara 6) (dado tiros c1 c2 c3 c4 c5 (+ c6 1) (random 1 7)))
          )
        )
      (begin
        (display "Cara 1\t")(display c1)(display "\t")(display (exact->inexact (* 100 (/ c1 tiros))))(displayln "%")
        (display "Cara 2\t")(display c2)(display "\t")(display (exact->inexact (* 100 (/ c2 tiros))))(displayln "%")
        (display "Cara 3\t")(display c3)(display "\t")(display (exact->inexact (* 100 (/ c3 tiros))))(displayln "%")
        (display "Cara 4\t")(display c4)(display "\t")(display (exact->inexact (* 100 (/ c4 tiros))))(displayln "%")
        (display "Cara 5\t")(display c5)(display "\t")(display (exact->inexact (* 100 (/ c5 tiros))))(displayln "%")
        (display "Cara 6\t")(display c6)(display "\t")(display (exact->inexact (* 100 (/ c6 tiros))))(displayln "%")
        (display "Tiros ")(display tiros)(display " de ")(display (+ c1 c2 c3 c4 c5 c6))
        )
      )
  )
;(dado 99999999 0 0 0 0 0 0 (random 1 7))