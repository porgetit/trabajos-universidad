#lang racket

(define (suma a b)
  (if (= a 0)
      (begin b)
      (begin
        (if (= b 0)
            (begin a)
            (begin
              (if (> a b)
                  (begin (suma (+ a 1) (- b 1)))
                  (begin (suma (- a 1) (+ b 1)))
                  )
              )
            )
        )
      )
  )

;(suma 3 7)

(define (resta a b)
  (if (= a 0)
      (begin b)
      (begin
        (if (= b 0)
            (begin a)
            (begin
              (if (> a b)
                  (begin (resta (- a 1) (- b 1)))
                  (begin (resta (- a 1) (- b 1)))
                  )
              )
            )
        )
      )
  )

;(resta 3 5)

(define (multiplicar a b)
  (if (> b 1)
      (begin (+ a (multiplicar a (- b 1))))
      (begin a)
      )
  )

;(multiplicar 3 9999990) ;6

;9999990

(define (multiplicarCompleto a b acumulador)
  (if (> b 0)
      (begin (multiplicarCompleto a (- b 1) (+ acumulador a)))
      (begin acumulador)
      )
  )

;(multiplicarCompleto 3 9999990 0)

(define (dividir a b acumulador)
  (if (>= a b)
      (dividir (- a b) b (+ acumulador 1))
      acumulador
      )
  )

(dividir 14 4 0)

(define (modulo a b)
  (if (>= a b)
      (modulo (- a b) b)
      a
      )
  )

(modulo 14 4)