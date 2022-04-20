#lang racket

(define (linea n iter)
  (cond
    (
     (< iter n)
     (begin
       (display "*")
       (linea n (add1 iter))
       )
     )
    )
  )

(define (lineaHueca n iter)
  (cond
    ((= iter 0) (display "*")
                (lineaHueca n (add1 iter))
                )
    ((< iter (sub1 n)) (display " ")
                       (lineaHueca n (add1 iter))
                       )
    (else
     (displayln "*")
     )
    )
  )

(define (cuadradoHueco n iter)
  (cond
    ((= iter 0) (linea n 0)(newline)
                (cuadradoHueco n (add1 iter))
                )
    ((and (not (zero? iter)) (< iter (sub1 n))) (lineaHueca n 0)
                       (cuadradoHueco n (add1 iter))
                       )
    (else
     (linea n 0)
     )
    )
  )

;(cuadradoHueco (read) 0)

(define (add2 a) (+ 2 a))

(define (espacios n iter)
  (cond
    (
     (< iter n)
     (begin
       (display " ")
       (espacios n (add1 iter))
       )
     )
    )
  )

(define (piramide n fila aster)
  (cond
    (
     (< fila (sub1 n))
     (begin
       (espacios (- n fila) 0)
       (linea aster 0)
       (newline)
       (piramide n (add1 fila) (add2 aster))
       )
     )
    (else
     (espacios (- n fila) 0)
     (linea aster 0)
     )
    )
  )

;(piramide 10 0 1)

(define (piramideInvertida n fila aster)
  (cond
    (
     (< fila (sub1 n))
     (begin
       (piramideInvertida n (add1 fila) (add2 aster))
       (espacios (- n (add1 fila)) 0)
       (linea aster 0)
       (newline)
       )
     )
    (else
     (linea aster 0)
     (newline)
     )
    )
  )

;(piramideInvertida 10 0 1)

(define (rombo n)
  (if (odd? n)
      (begin
        (piramide (floor (/ n 2)) 0 1)
        (newline)
        (piramideInvertida (ceiling (/ n 2)) 0 1)
        )
      (begin
        (display "n debe ser impar")
        (rombo (read))
        )
      )
  )

;(rombo (read))

(define (piramideHueca n fila aster)
  (cond
    ((= fila 0)
     (begin
       (espacios (- n fila) 0)
       (linea aster 0)
       (newline)
       (piramideHueca n (add1 fila) (add2 aster))
       )
     )
    ((< fila (sub1 n))
     (begin
       (espacios (- n fila) 0)
       (lineaHueca aster 0)
       (piramideHueca n (add1 fila) (add2 aster))
       )
     )
    (else
     (espacios (- n fila) 0)
     (linea aster 0)
     )
    )
  )

;(piramideHueca 10 0 1)

(define (piramideInvertidaHueca n fila aster)
  (cond
    ((= fila 0)
     (begin
       (piramideInvertidaHueca n (add1 fila) (add2 aster))
       (espacios (- n (add1 fila)) 0)
       (linea aster 0)
       (newline)
       )
     )
    ((< fila (sub1 n))
     (begin
       (piramideInvertidaHueca n (add1 fila) (add2 aster))
       (espacios (- n (add1 fila)) 0)
       (lineaHueca aster 0)
       )
     )
    (else
     (linea aster 0)
     (newline)
     )
    )
  )

;(piramideInvertidaHueca 10 0 1)

(define (romboHueco n)
  (if (odd? n)
      (begin
        (piramideHueca (floor (/ n 2)) 0 1)
        (newline)
        (piramideInvertidaHueca (ceiling (/ n 2)) 0 1)
        )
      (begin
        (displayln "n debe ser impar")
        (romboHueco (read))
        )
      )
  )

(romboHueco (read))