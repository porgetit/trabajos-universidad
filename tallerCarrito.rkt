#lang racket

(require (lib "graphics.ss" "graphics"))
(open-graphics)

(define _main_ (open-viewport "Main" 1000 600))

#|Fondo|#
((draw-viewport _main_) (make-rgb 0.9 0.9 0.9))

#|Piso|#
((draw-solid-rectangle _main_) (make-posn 0 400) 650 200 "black")
((draw-solid-rectangle _main_) (make-posn 650 400) 25 200 "white")
((draw-solid-rectangle _main_) (make-posn 675 400) 325 200 "black")

#|Carro|#
(define (carro x y)
  ((draw-solid-rectangle _main_) (make-posn x y) 80 40 "purple")
  ((draw-solid-rectangle _main_) (make-posn (+ x 80) (+ y 15)) 20 25 "purple")
  ((draw-solid-rectangle _main_) (make-posn (+ x 60) (+ y 2.5)) 20 12.5 "cyan")
  ((draw-solid-rectangle _main_) (make-posn (+ x 95) (+ y 16)) 5 7.5 "orange")
  ((draw-solid-ellipse _main_) (make-posn (+ x 12.5) (+ y 25)) 25 25 (make-rgb 0.1 0.1 0.1))
  ((draw-solid-ellipse _main_) (make-posn (+ x 62.5) (+ y 25)) 25 25 (make-rgb 0.1 0.1 0.1))
  )

#|Semáforo|#
((draw-solid-rectangle _main_) (make-posn 700 150) 50 150 "black")
((draw-solid-rectangle _main_) (make-posn 720 0) 10 150 (make-rgb 0 0.1 0))
((draw-solid-ellipse _main_) (make-posn 712.5 162.5) 25 25 "red")
((draw-solid-ellipse _main_) (make-posn 712.5 212.5) 25 25 (make-rgb 0.2 0.2 0.2))
((draw-solid-ellipse _main_) (make-posn 712.5 262.5) 25 25 (make-rgb 0.2 0.2 0.2))

#|Borrador|#
(define (cleaner x y w h)
  ((draw-solid-rectangle _main_) (make-posn x y) w h (make-rgb 0.9 0.9 0.9))
  )

#|Animación|#
(define (animacion-carro-1 x y)
  (cond
    ((< x 549)
      (begin
        (carro x y)
        (sleep 0.005)
        (cleaner x y 100 50)
        (animacion-carro-1 (add1 x) y) 
        ))
    (else
     (carro x y)
     )
      )
  )

(define (animacion-semaforo-1)
  (sleep 2)
  ((draw-solid-ellipse _main_) (make-posn 712.5 162.5) 25 25 (make-rgb 0.2 0.2 0.2))
  (sleep 0.25)
  ((draw-solid-ellipse _main_) (make-posn 712.5 212.5) 25 25 "yellow")
  (sleep 0.5)
  ((draw-solid-ellipse _main_) (make-posn 712.5 212.5) 25 25 (make-rgb 0.2 0.2 0.2))
  (sleep 0.5)
  ((draw-solid-ellipse _main_) (make-posn 712.5 262.5) 25 25 "green")
  (sleep 0.8)
  )

(define (animacion-carro-2 x y)
  (cond
    ((< x 899)
      (begin
        (carro x y)
        (sleep 0.005)
        (cleaner x y 100 50)
        (animacion-carro-2 (add1 x) y) 
        ))
    (else
     (carro x y)
     )
      )
  )

(define (secuencia-1)
  (animacion-carro-1 100 350)
  (animacion-semaforo-1)
  (animacion-carro-2 549 350)
  (sleep 1)
  )

(secuencia-1)

(close-viewport _main_)