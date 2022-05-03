#lang racket

(require (lib "image.ss" "teachpack/htdp"))

;(define a (make-vector 6 "motomami"))
;(define b (vector 0 1 2 3 4 5 6 7 8 9 (number->string 10) "motomami" (circle 15 "solid" 'red) (rectangle 100 50 "solid" 'black)))
(define c (make-vector 8 (make-vector 8 1)))
;(vector-length a)
;(vector-length b)

;(printf "~a\n~a\n" (vector-ref b 12) (vector-ref b 13))
c

(vector-set! c 0 10)


(define vec (vector 1 2 3 4) (vec))