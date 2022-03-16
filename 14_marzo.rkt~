#lang racket

#|
 · Descomponemos el número --
  · Si todos los números son pares, mostramos -> 0 --
 · Ordenamos los dígitos de menor a mayor
 · Quitamos los número pares
 · Sumamos los tres primeros
|#

(define (miles numero)
  (floor (/ numero 1000))
  )

(define (centenas numero)
  (define x (remainder numero 1000))
  (floor (/ x 100))
  )

(define (decenas numero)
  (define x (remainder numero 1000))
  (define y (remainder x 100))
  (floor (/ y 10))
  )
(define (unidades numero)
  (define x (remainder numero 1000))
  (define y (remainder x 100))
  (remainder y 10)
  )

(define (par? numero)
  (if (= (remainder numero 2) 0)
      (begin
        #t
        )
      (begin
        #f
        )
      )
  )

(define (quitar.pares a1 a2 a3 a4)
  (if (par? a1)
      (begin ; 0 + a2 + a3 + a4
        (if (par? a2)
            (begin ; 0 + 0 + a3 + a4
              (if (par? a3)
                  (begin ; a4
                    (if (par? a4)
                        (begin 0)
                        (begin a4)
                        )
                    )
                  (begin ; a3 + a4
                    (if (par? a4)
                        (begin a3)
                        (begin (+ a3 a4))
                        )
                    )
                  )
              )
            (begin ; 0 + a2 + a3 + a4
              (if (par? a3)
                  (begin ; a2 + a4
                    (if (par? a4)
                        (begin a2)
                        (begin (+ a2 a4))
                        )
                    )
                  (begin ; a2 + a3 + a4
                    (if (par? a4)
                        (begin (+ a2 a3))
                        (begin (+ a2 a3 a4))
                        )
                    )
                  )
              )
            )
        )
      (begin ; a1 + a2 + a3 + a4
        (if (par? a2)
            (begin ; a1 + 0 + a3 + a4
              (if (par? a3)
                  (begin ; a1 + a4
                    (if (par? a4)
                        (begin a1)
                        (begin (+ a1 a4))
                        )
                    )
                  (begin ; a1 + a3 + a4
                    (if (par? a4)
                        (begin (+ a1 a3))
                        (begin (+ a1 a3 a4))
                        )
                    )
                  )
              )
            (begin ; a1 + a2 + a3 + a4
              (if (par? a3)
                  (begin ; a1 + a2 + a4
                    (if (par? a4)
                        (begin (+ a1 a2))
                        (begin (+ a1 a2 a4))
                        )
                    )
                  (begin ; a1 + a2 + a3
                    (if (par? a4)
                        (begin (+ a1 a2 a3))
                        (begin (+ a1 a2 a3))
                        )
                    )
                  )
              )
            )
        )
      )
  )

(define (menor.dos primer_menor segundo_menor a b)
  (if (< a b)
      (begin ; a < b
        (quitar.pares primer_menor segundo_menor a b)
        )
      (begin ; b < a
        (quitar.pares primer_menor segundo_menor b a)
        )
      )
  )

(define (menor.tres primer_menor a b c)
  (cond
    ((and (< a b) (< a c)) (menor.dos primer_menor a b c))
    ((and (< b a) (< b c)) (menor.dos primer_menor b a c))
    ((and (< c a) (< c b)) (menor.dos primer_menor c a b))
    (else "error menor.tres")
    )
  )

(define (impares.orden.menor->mayor a b c d)
  (cond
    ((and (< a b) (< a c) (< a d)) (menor.tres a b c d))
    ((and (< b a) (< b c) (< b d)) (menor.tres b a c d))
    ((and (< c a) (< c b) (< c d)) (menor.tres c a b d))
    ((and (< d a) (< d b) (< d c)) (menor.tres d a b c))
    (else "error menor.cuatro")
    )
  )

(define (menor.tres.repetidos primer_menor b c d)
  "menor.tres.repetidos"
  )

(define (impares.orden.menor->mayor.repetidos a b c d)
  (display "Hay datos repetidos")
  (cond
    ((or (= a b) (= a c) (= a d)) (menor.tres.repetidos a b c d))

    ((= b a))
    ((= b c))
    ((= c d))

    ((= c a))
    ((= c b))
    ((= c d))

    ((= d a))
    ((= d b))
    ((= d c))
    )
  )

(define (pares? miles centenas decenas unidades)
  (cond
    ((and (par? miles) (par? centenas) (par? decenas) (par? unidades)) 0)
    ((or
      (or (= miles centenas) (= miles decenas) (= miles unidades))
      (or (= centenas miles) (= centenas decenas) (= centenas unidades))
      (or (= decenas miles) (= decenas centenas) (= decenas unidades))
      (or (= unidades miles) (= unidades centenas) (= unidades decenas))
      )
     (impares.orden.menor->mayor.repetidos miles centenas decenas unidades)
     )
    (else (impares.orden.menor->mayor miles centenas decenas unidades))
    )
  )

(define (descomponer numero)
  (define Miles (miles numero))
  (define Centenas (centenas numero))
  (define Decenas (decenas numero))
  (define Unidades (unidades numero))
  (pares? Miles Centenas Decenas Unidades)
  )

(define (principal)
  (begin
    (display "Ingrese un número de 4 cifras: ")
    (define numero (read))
    (descomponer numero)
    )
  )
(principal)