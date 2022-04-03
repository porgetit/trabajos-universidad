#lang racket

(define (pares n m)
  (cond
    ((> n m)
     (begin
       (if (= (remainder n 2) 0)
           (begin
             (displayln n)
             (pares (- n 1) m)
             )
           (begin
             (pares (- n 1) m)
             )
           )
       )
     )
    ((< n m)
     (begin
       (if (= (remainder n 2) 0)
           (begin
             (displayln n)
             (pares (+ n 1) m)
             )
           (begin
             (pares (+ n 1) m)
             )
           )
       )
     )
    (else
     (cond ((= (remainder n 2) 0) (displayln n)))
     )
    )
  )

;(pares 0 6)

(define (cuadradosCubos n m)
  (cond
    ((> n m)
     (begin
       (display n)(display "\t")(display (* n n))(display "\t")(displayln (* n n n))
       (cuadradosCubos (- n 1) m)
       )
     )
    ((< n m)
      (begin
       (display n)(display "\t")(display (* n n))(display "\t")(displayln (* n n n))
       (cuadradosCubos (+ n 1) m)
       )
     )
    (else
      (begin
       (display n)(display "\t")(display (* n n))(display "\t")(displayln (* n n n))
       )
     )
    )
  )

;(cuadradosCubos 5 0)

(define (complemento n m)
  (cond
    ((> n m)
     (begin
       (display n)(display "\t")
       (display (* n n))(display "\t")
       (display (* n n n))(display "\t")
       (display (expt n 1/2))(display "\t")
       (displayln (expt n 1/3))
       (complemento (- n 1) m)
       )
     )
    ((< n m)
      (begin
       (display n)(display "\t")
       (display (* n n))(display "\t")
       (display (* n n n))(display "\t")
       (display (expt n 1/2))(display "\t")
       (displayln (expt n 1/3))
       (complemento (+ n 1) m)
       )
     )
    (else
     (begin
       (display n)(display "\t")
       (display (* n n))(display "\t")
       (display (* n n n))(display "\t")
       (display (expt n 1/2))(display "\t")
       (displayln (expt n 1/3))
       )
     )
    )
  )

;(complemento 8 8)

(define (impares n m acumulador)
  (cond
    ((> n m)
     (begin
       (if (odd? n)
           (impares (- n 1) m (+ acumulador n))
           (impares (- n 1) m acumulador)
           )
       )
     )
    ((< n m)
     (begin
       (if (odd? n)
           (impares (+ n 1) m (+ acumulador n))
           (impares (+ n 1) m acumulador)
           )
       )
     )
    (else
     (cond ((odd? n) (display (+ acumulador n)))
           (else (display acumulador)))
     )
    )
  )

;(impares 5 1 0)

(define (factorial? n m acumulador)
  (cond
    ((> n m)
     (begin
       (factorial? (- n 1) m (* acumulador (* n n)))
       )
     )
    ((< n m)
     (begin
       (factorial? (+ n 1) m (* acumulador (* n n)))
       )
     )
    (else
     (begin
       (display (* acumulador (* n n)))
       )
     )
    )
  )

;(factorial? 3 1 1)

(define (factorial n)
  (if (= n 0)
      (begin 1)
      (begin
        (* n (factorial (- n 1)))
        )
      )
  )

(define (factorial! n)
  (/ (factorial n) n)
  )

;(factorial! 5)

(define (cuadradosImpares n m acumulador)
  (cond
    ((> n m)
     (if (odd? n)
         (cuadradosImpares (- n 1) m (* acumulador (* n n)))
         (cuadradosImpares (- n 1) m acumulador)
         )
     )
    ((< n m)
     (if (odd? n)
         (cuadradosImpares (+ n 1) m (* acumulador (* n n)))
         (cuadradosImpares (+ n 1) m acumulador)
         )
     )
    (else
     acumulador
     )
    )
  )

(define (cuadradosImparesSinExtremos n m)
  (/ (cuadradosImpares n m 1) (* n n))
  )

;(cuadradosImparesSinExtremos 1 6)

(define (sumaPares n m acumulador)
  (cond
    ((> n m)
     (if (not (odd? n))
         (begin (sumaPares (- n 1) m (+ acumulador n)))
         (begin (sumaPares (- n 1) m acumulador))
         )
     )
    ((< n m)
     (if (not (odd? n))
         (begin (sumaPares (+ n 1) m (+ acumulador n)))
         (begin (sumaPares (+ n 1) m acumulador))
         )
     )
    (else
     (if (not (odd? n))
         (+ acumulador n)
         acumulador
         )
     )
    )
  )

;(sumaPares 2 8 0)

(define (naturalesEntreNyM n m contador)
  (cond
    ((> n m)
     (naturalesEntreNyM (- n 1) m (+ contador 1))
     )
    ((< n m)
     (naturalesEntreNyM (+ n 1) m (+ contador 1))
     )
    (else
     (+ contador 1)
     )
    )
  )

;(naturalesEntreNyM 2 8 0) ;7

(define (impares% n m acumulador contador)
  (cond
    ((> n m)
     (impares% (- n 1) m (+ acumulador n) (+ contador 1))
     )
    ((< n m)
     (impares% (+ n 1) m (+ acumulador n) (+ contador 1))
     )
    (else
     (/ (+ acumulador n) (+ contador 1))
     )
    )
  )

;(impares% 5 1 0 0)

(define (p3b n contador)
  (cond
    ((> n 30)
     (begin
       (if (< contador 30)
           (begin (p3b n (+ contador 1)))
           (begin
             (if (< contador n)
                 (begin
                   (if (not (odd? contador))
                       (begin
                         (displayln (* contador contador))
                         (p3b n (+ contador 1))
                         )
                       (begin
                         (p3b n (+ contador 1))
                         )
                       )
                   )
                 (begin
                   (cond ((not (odd? contador)) (displayln (* contador contador))))
                   )
                 )
             )
           )
       )
     )
    ((<= n 15)
     (begin
       (if (< contador 1)
           (begin (p3b n (+ contador 1)))
           (begin
             (if (< contador n)
                 (begin
                   (if (not (odd? contador))
                       (begin (displayln contador)
                              (p3b n (+ contador 1)))
                       (begin (p3b n (+ contador 1)))
                       )
                   )
                 (begin
                   (cond ((not (odd? contador)) (displayln contador)))
                   )
                 )
             )
           )
       )
     )
    (else
     (begin
       (if (< contador 15)
           (begin (p3b n (+ contador 1)))
           (begin
             (if (< contador n)
                 (begin
                   (if (not (odd? contador))
                       (begin
                         (displayln contador)
                         (p3b n (+ contador 1))
                         )
                       (begin
                         (p3b n (+ contador 1))
                         )
                       )
                   )
                 (begin
                   (cond ((not (odd? contador)) (displayln contador)))
                   )
                 )
             )
           )
       )
     )
    )
  )

;(p3b 32 0)

(define (sumatoria n acumulador)
  (if (> n 1)
      (begin
        (printf "~a+" n)
        (sumatoria (- n 1) (+ acumulador n))
        )
      (begin
        (printf "~a=~a\n" n (+ acumulador n))
        )
      )
  )

(define (p4 n contador)
  (cond
    ((> n 30)
     (begin
       (if (< contador 30)
           (begin (p4 n (+ contador 1)))
           (begin
             (if (< contador n)
                 (begin
                   (display contador)(display "\t")(displayln (* contador contador))
                   (p4 n (+ contador 1))
                   )
                 (begin
                   (display contador)(display "\t")(displayln (* contador contador))
                   )
                 )
             )
           )
       )
     )
    ((<= n 15)
     (begin
       (if (< contador 1)
           (begin (p4 n (+ contador 1)))
           (begin
             (if (< contador n)
                 (begin (display contador)(display "\t")
                        (displayln (factorial contador))
                        (p4 n (+ contador 1)))
                 (begin (display contador)(display "\t")
                        (displayln (factorial contador)))
                 )
             )
           )
       )
     )
    (else
     (begin
       (if (< contador 15)
           (begin (p4 n (+ contador 1)))
           (begin
             (if (< contador n)
                 (begin
                   (sumatoria contador 0)
                   (p4 n (+ contador 1))
                   )
                 (begin
                   (sumatoria contador 0)
                   )
                 )
             )
           )
       )
     )
    )
  )

;(p4 16 0)

(define (adivina n contador)
  (define intento (read))
  (if (= contador 5)
      (begin "No le quedan intentos, ¡perdió!")
      (begin
        (if (= intento n)
            (printf "¡Excelente! ~a era el número correcto. Intentos: ~a" intento contador)
            (adivina n (+ contador 1))
            )
        )
      )
  )

;(adivina (random 1 6) 1)

(define (moneda tiros caras sellos)
  (if (< (+ caras sellos) tiros)
      (begin
        (if (= (random 0 2) 1)
            (begin (moneda tiros (+ caras 1) sellos))
            (begin (moneda tiros caras (+ sellos 1)))
            )
        )
      (begin
        (printf "Caras:\t~a\t~a%\nSellos:\t~a\t~a%" caras (exact->inexact (* (/ caras tiros) 100)) sellos (exact->inexact (* (/ sellos tiros) 100)))
        )
      )
  )

;(moneda 1000 0 0)

(define (dados tiros dado1 dado2 pares contador)
  (if (< contador tiros)
      (begin
        (if (= dado1 dado2)
            (begin (printf "Tiro:\t~a\tDado 1:\t~a\tDado 2:\t~a\tPares: ~a\n" contador dado1 dado2 (+ pares 1))
                   (dados tiros (random 1 7) (random 1 7) (+ pares 1) (+ contador 1)))
            (begin (printf "Tiro:\t~a\tDado 1:\t~a\tDado 2:\t~a\tPares: ~a\n" contador dado1 dado2 pares)
                   (dados tiros (random 1 7) (random 1 7) pares (+ contador 1)))
            )
        )
      (begin
        (if (= dado1 dado2)
            (begin (printf "Tiro:\t~a\tDado 1:\t~a\tDado 2:\t~a\tPares: ~a\n" contador dado1 dado2 (+ pares 1)))
            (begin (printf "Tiro:\t~a\tDado 1:\t~a\tDado 2:\t~a\tPares: ~a\n" contador dado1 dado2 pares))
            )
        )
      )
  )

(dados 1000 (random 1 7) (random 1 7) 0 1)