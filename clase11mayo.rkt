#lang racket

(require (lib "graphics.ss" "graphics"))
(open-graphics)

(define _main_ (open-viewport "Window" 1100 800))

(define (cuadrado x y color)
  (if (= x 950)
      (display "fin")
      (begin
        ((draw-solid-rectangle _main_) (make-posn x y) 50 50 (colores color))
        (sleep 0.001)
        ;((draw-solid-rectangle _main_) (make-posn x y) 50 50 "white")
        (cuadrado (add1 x) y (random 0 5))
        )
      )
  )

(define (colores x)
  (cond
    ((= x 0) "green")
    ((= x 1) "black")
    ((= x 2) "red")
    ((= x 3) "yellow")
    ((= x 4) "purple")
    )
  )

(define (linea x y)
  (if (= x 1000)
      ((draw-pixel _main_) (make-posn 0 100) "green")
      (begin
        ((draw-pixel _main_) (make-posn x y) "green")
        (sleep 0.001)
        (linea (add1 x) y)
        )
      )
  )

(define (solido r g b)
  (if (= b 1)
      (if (= g 1)
          (if (= r 1)
              ((draw-solid-rectangle _main_) (make-posn 0 300) 1000 300 (make-rgb 0 g b))
              (begin
                ((draw-solid-rectangle _main_) (make-posn 0 300) 1000 300 (make-rgb r g b))
                (sleep 0.1)
                (solido (exact->inexact (+ r 0.2)) g b)
                )
              )
          (begin
            ((draw-solid-rectangle _main_) (make-posn 0 300) 1000 300 (make-rgb 0 g b))
            (sleep 0.1)
            (solido r (exact->inexact (+ g 0.2)) b)
            )
          )
      (begin
        ((draw-solid-rectangle _main_) (make-posn 0 300) 1000 300 (make-rgb 0.5 0 0))
        (sleep 0.1)
        (solido r g (exact->inexact (+ b 0.2)))
        )
      )
  )

;(linea 0 100)
;(cuadrado 0 200 (random 0 5))
;(solido 0 0 0)


(define (dibujar op)
  (cond
    ((= op 1) (begin
                ((draw-solid-rectangle _main_) (make-posn 100 100) 50 50 "red")
                (sleep 1)
                ((draw-solid-rectangle _main_) (make-posn 100 100) 50 50 "white")
                ))
    ((= op 2) (begin
                ((draw-solid-rectangle _main_) (make-posn 160 100) 50 50 "blue")
                (sleep 1)
                ((draw-solid-rectangle _main_) (make-posn 160 100) 50 50 "white")
                ))
    ((= op 3) (begin
                ((draw-solid-rectangle _main_) (make-posn 160 160) 50 50 "green")
                (sleep 1)
                ((draw-solid-rectangle _main_) (make-posn 160 160) 50 50 "white")
                ))
    ((= op 4) (begin
                ((draw-solid-rectangle _main_) (make-posn 100 160) 50 50 "red")
                (sleep 1)
                ((draw-solid-rectangle _main_) (make-posn 100 160) 50 50 "white")
                ))
    )
  )

(define (recursividad op)
  (if (< op 5)
      (begin
        (dibujar op)
        (recursividad (add1 op))
        )
      (begin
        (recursividad 0)
        )
      )
  )

(recursividad 0)