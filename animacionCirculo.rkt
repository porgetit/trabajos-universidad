#lang racket

(require (lib "graphics.ss" "graphics"))
(open-graphics)

(define _main_ (open-viewport "ventana" 500 500))

#|Circulo|#
(define (circulo x y radio)
  ((draw-solid-ellipse _main_) (make-posn x y) radio radio "cyan")
  )

#|Animación 1|#
(define (animacion-1 x y iter case)
  (cond
    ((not (odd? case))
     (begin
       (cond ((< iter 250) (begin
                             (circulo x y iter)
                             (animacion-1 x y (add1 iter) case)
                             ))
             (else
              
              ))
       )
     )
    ((odd? case))
    )
  )