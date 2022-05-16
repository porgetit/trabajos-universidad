#lang racket

(require (lib "graphics.ss" "graphics"))
(open-graphics)

(define _main_ (open-viewport "Taller animaciones" 1201 750 ))

#|Rejilla|#
;horizontales
((draw-line _main_) (make-posn 0 100) (make-posn 1200 100) "black")
((draw-line _main_) (make-posn 0 400) (make-posn 1200 400) "black")
((draw-line _main_) (make-posn 300 700) (make-posn 900 700) "black")
;verticales
((draw-line _main_) (make-posn 0 100) (make-posn 0 400) "black")
((draw-line _main_) (make-posn 1200 100) (make-posn 1200 400) "black")
((draw-line _main_) (make-posn 600 100) (make-posn 600 400) "black")
((draw-line _main_) (make-posn 300 400) (make-posn 300 700) "black")
((draw-line _main_) (make-posn 900 400) (make-posn 900 700) "black")

#|Animación 1 (0,100)->(600,400)|#
(define (cuadrado x y w h color)
  ((draw-solid-rectangle _main_) (make-posn x y) w h color)
  )

(define (clean x y w h)
  ((draw-solid-rectangle _main_) (make-posn x y) w h "white")
  )

(define (animacion-1 x y iter)
  (cond
    ((<= iter 4)
     (begin
       (cuadrado x y 75 50 "red")
       (sleep 0.5)
       (clean x y 75 50)
       (animacion-1 (+ 125 x) y (add1 iter))
       )
     )
    ((<= iter 5)
     (begin
       (cuadrado (- x 125) (+ y 100) 75 50 "red")
       (sleep 0.5)
       (clean (- x 125) (+ y 100) 75 50)
       (animacion-1 (- x 125) (+ y 200) (add1 iter))
       )
     )
    ((<= iter 10)
     (begin
       (cuadrado x y 75 50 "red")
       (sleep 0.5)
       (clean x y 75 50)
       (animacion-1 (- x 125) y (add1 iter))
       )
     )
    ((<= iter 11)
     (begin
       (cuadrado (+ x 125) (- y 100) 75 50 "red")
       (sleep 0.5)
       (clean (+ x 125) (- y 100) 75 50)
       (animacion-1 x y (add1 iter))
       )
     )
    )
  )

(animacion-1 12.5 125 0)

#|Animación 2 (600,100)->(1200,400)|#
(define (punto x y)
  ((draw-pixel _main_) (make-posn x y) "green")
  )

(define (animacion-2 x y iter)
  (cond
    ((= iter 0)
     (begin
       (if (<= x 1150)
           (begin
             (punto x y)
             (sleep 0.001)
             (animacion-2 (add1 x) y iter)
             )
           (begin
             (animacion-2 x (add1 y) (add1 iter))
             )
           )
       )
     )
    ((= iter 1)
     (begin
       (if (<= y 350)
           (begin
             (punto x y)
             (sleep 0.001)
             (animacion-2 x (add1 y) iter)
             )
           (begin
             (animacion-2 (sub1 x) y (add1 iter))
             )
           )
       )
     )
    ((= iter 2)
     (begin
       (if (>= x 650)
           (begin
             (punto x y)
             (sleep 0.001)
             (animacion-2 (sub1 x) y iter)
             )
           (begin
             (animacion-2 x (sub1 y) (add1 iter))
             )
           )
       )
     )
    (else
     (begin
        (cond
          ((>= y 150)
           (begin
             (punto x y)
             (sleep 0.001)
             (animacion-2 x (sub1 y) iter)
             ))
          )
        )
     )
    )
  )

(animacion-2 650 150 0)

#|Animación 3 (300,400)->(900,700)|#
(define (animacion-3 x y w h iter)
  (cond
    ((< iter 10)
      (begin
        (cuadrado x y w h "blue")
        (sleep 0.25)
        (clean x y w h)
        (animacion-3 (random 375 825) (random 475 625) (random 25 75) (random 25 75) (add1 iter))
        ))
      )
  )

(animacion-3 (random 375 825) (random 475 625) (random 25 75) (random 25 75) 0)

(close-viewport _main_)
(close-graphics)