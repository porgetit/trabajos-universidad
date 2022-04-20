#lang racket

(define (potencia n m)
  (if (> m 1)
      (begin
        (* n (potencia n (- m 1)))
        )
      (begin
        n
        )
      )
  )

(define (suma n m)
  (if (< n m)
      (begin
        (if (not (zero? n))
            (begin
              (suma (- n 1) (+ m 1))
              )
            (begin
              m
              )
            )
        )
      (begin
        (if (not (zero? m))
            (begin
              (suma (+ n 1) (- m 1))
              )
            (begin
              n
              )
            )
        )
      )
  )

(define (fibonacciSerie n)
  (cond
    ((or (zero? n) (= n 1)) n)
    (else
     (+ (fibonacciSerie (- n 1)) (fibonacciSerie (- n 2)))
     )
    )
  )

(define (divisionZ n m cociente)
  (if (>= n m)
      (begin
        (divisionZ (- n m) m (add1 cociente))
        )
      (begin
        cociente
        )
      )
  )

(define (adivinar userInput number countFails)
  (if (= userInput number)
      (begin
        (display "¡Correcto!, el número es: ")(displayln number)
        (display "Le tomó ")(display (add1 countFails))(displayln " intentos para adivinarlo")
        )
      (begin
        (displayln "Lo siento, pruebe de nuevo")
        (adivinar (read) number (add1 countFails))
        )
      )
  )

;(adivinar (read) (random 1 11) 0)

(define (tabla10 n multiplicador)
  (if (< multiplicador 10)
      (begin
        (display n)(display " * ")(display multiplicador)(display " = ")(displayln (* n multiplicador))
        (tabla10 n (add1 multiplicador))
        )
      (begin
        (display n)(display " * ")(display multiplicador)(display " = ")(displayln (* n multiplicador))
        )
      )
  )

(define (sumaImpares n acumulador)
  (cond
    ((>= n 1)
     (if (odd? n)
         (sumaImpares (- n 1) (+ acumulador n))
         (sumaImpares (- n 1) acumulador)
         )
     )
    (else
     acumulador
     )
    )
  )

(define (p16 n num a1 a2 c1 c2)
  (cond
    ((> n 0)
     (begin
       (if (positive? num)
           (p16 (- n 1) (read) (+ a1 num) a2 (add1 c1) c2)
           (p16 (- n 1) (read) a1 (+ a2 num) c1 (add1 c2))
           )
       )
     )
    (else
     (displayln (/ a1 c1))
     (displayln (/ a2 c2))
     )
    )
  )

;(p16 (read) (read) 0 0 0 0)

(define (p18 n a1 a2 c1 c2)
  (cond
    ((> n 0)
     (p18 (read) (+ a1 n) a2 (add1 c1) c2)
     )
    ((< n 0)
     (p18 (read) a1 (+ a2 n) c1 (add1 c2))
     )
    (else
     (displayln (/ a1 c1))
     (display (/ a2 c2))
     )
    )
  )

;(p18 (read) 0 0 0 0)

(define (sumaDigitos n)
  (define l (string->list n))
  (display l)
  )

(sumaDigitos (read))

