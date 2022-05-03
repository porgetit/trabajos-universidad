#lang racket

(define (fib n)
  (if (or (= n 0) (= n 1))
      (begin
        n
        )
      (begin
        (+ (fib (- n 1)) (fib (- n 2)))
        )
      )
  )

(define (iter n contador)
  (if (< contador n)
      (begin
        (display contador)(display "\t")
        (displayln (fib contador))
        (iter n (add1 contador))
        )
      (begin
        (display contador)(display "\t")
        (displayln (fib contador))
        )
      )
  )

;(iter 10 0)


(define (fibCompuesto n m n-1 n-2)
  (cond
    ((<= n m)
     (if (or (= n 0) (= n 1))
         (begin (displayln n)
                (fibCompuesto (+ n 1) m n (- n 1))
                )
         (begin
           (printf "(n: ~a) n-1 ~a n-2 ~a -> (+ n-1 n-2)= ~a\n" n n-1 n-2 (+ n-1 n-2))
           (fibCompuesto (+ n 1) m n (- n 1))
           )
         )
     )
    )
  )

(define (fibCompuestob n contador return)
  (cond ((<= contador n)
      (begin
        (if (or (= contador 0) (= contador 1))
          (begin (displayln contador)
                 (fibCompuestob n (add1 contador) contador))
          (begin (displayln (+ return (- return 1)))
                 (fibCompuestob n (add1 contador) (+ return (- return 1))))
          )
        ))
      
      )
  )

;(fibCompuestob 6 0 0)

(define (func n m)
  (if (or (= n 0) (= n 1))
      (begin
        (displayln n)
        
        )
      (begin
        (display (+ (func (- n 1) m) (func (- n 2) m)))
        (func (+ n 1) m)
        )
      )
  )

(func 0 5)