#lang racket

(define (ejercicio7)
  (define(mayor1 n numero mayor contar)
    (if(not(= n contar))
       {begin
         (if(> numero mayor)
            {begin
              (mayor1 n (read) numero (+ contar 1))}
            {begin
              (mayor1 n (read) mayor (+ contar 1))})}
       {begin mayor}))

  (define(principal_7)
    {begin
      (display "¿De cuántos números es la lista?")
      (define n(read))
      (displayln "Cuando vea la posibilidad de escribir, escriba un número")
      (define numero (read))
      (displayln (mayor1 n numero 0 0))})
  (principal_7)
  )

(define (ejercicio4)
  (define (tabla n m multiplicador)
    (if (< multiplicador m)
        (begin
          (display n)(display " * ")(display multiplicador)(display " = ")(displayln (* n multiplicador))
          (tabla n m (add1 multiplicador))
          )
        (begin
          (display n)(display " * ")(display multiplicador)(display " = ")(displayln (* n multiplicador))
          )
        )
    )
  (define (tablas n m)
    (if (< n m)
        (begin
          (tabla n m 0)
          (newline)
          (tablas (+ n 1) m)
          )
        (begin
          (tabla n m 0)
          )
        )
    )

  (tablas 1 13)
  )

(define (ejercicio2)
  ;Programa 2
  (define (fib n)
    (if (or(<= n 0)(= n 1))
        [begin
          1]
        [begin
          (+ (fib (- n 1))(fib (- n 2)))
          ]
        )
    )



  (define (iter n m acumulador)
    (cond ((< n 0)(display n)(display " NO pertenece a una posicion de la serie de Fibonacci"))
          ((= n m)(display (+ acumulador (fib n))))
          ((< n m)(iter (+ n 1) m (+ acumulador (fib n))))
                        
              
          )
    )
  (iter (read)(read) 0)
  )

(define (ejercicio6)
  (define (numerosrepetidos n ran cont contador)
    (cond
      ((> n contador)
       [begin
         (cond
           ((= ran n)
            [begin
              (displayln ran)
              (numerosrepetidos n (random 10) (+ cont 1) (+ contador 1))])
           (else
            [begin
              (displayln ran)
              (numerosrepetidos n (random 10) cont (+ contador 1))])
           )])
      (else
       [begin
         (display "El número ")(display n)(display " se repite: ")(display cont)(display " veces")
         ])
      ))

  (numerosrepetidos (read) (random 10) 0 0)
  )

(define (ejercicio10)
  (define (factorial n)
    (if (zero? n)
        1
        (* n (factorial (- n 1)))
        )
    )
  (define (primo? n multiplicador contador)
    (cond
      ((<= multiplicador n)
       (begin
         (if (= (remainder n multiplicador) 0)
             (primo? n (add1 multiplicador) (add1 contador))
             (primo? n (add1 multiplicador) contador)
             )
         )
       )
      (else
       (cond ((<= contador 2) (displayln (factorial n))))
       )
      )
    )
  (define (iter n m)
    (cond
      ((<= n m)
       (begin
         (primo? n 1 0)
         (iter (add1 n) m)
         )
       )
      )
    )
  (iter 5 10)
  )

(define (ejercicio8)
  (define(primo n numb)
    (modulo n numb))

  (define(primeracondicion n numb contador)
    (if
     (= numb n)
     {begin contador}
     {begin
       (if(not(>= contador 2))
          {begin
            (if(and(> n (+ numb 1))(=(primo n numb)0))
               {begin
                 (primeracondicion n (+ numb 1)(+ contador 1))
                 }
               {begin
                 (primeracondicion n (+ numb 1) contador)
                 })
            }
          {begin contador}
          )
       }  
     ))
  (define(segundacondicion n numb contador)
    (if(= n 2)
       1
       {begin
         (if
          (>=(primeracondicion n numb contador) 2)
          2
          1
          )}))


  (define(primos n)
    {begin
      (display n)(display "\t")
      (segundacondicion n 1 0)})


  (define(tablamul n m)
    (cond
      ((not(> n m))
       {begin
         (if(= 1 (segundacondicion n 1 0))
            {begin
              (display n)(display" x 1 = ")(displayln (* n 1))
              (display n)(display" x 2 = ")(displayln (* n 2))
              (display n)(display" x 3 = ")(displayln (* n 3))
              (display n)(display" x 4 = ")(displayln (* n 4))
              (display n)(display" x 5 = ")(displayln (* n 5))
              (display n)(display" x 6 = ")(displayln (* n 6))
              (display n)(display" x 7 = ")(displayln (* n 7))
              (display n)(display" x 8 = ")(displayln (* n 8))
              (display n)(display" x 9 = ")(displayln (* n 9))
              (display n)(display" x 10 = ")(displayln (* n 10))
              "Tabla"
              (tablamul(+ n 1) m)}
            {begin (tablamul (+ n 1)m)})
         }
       )
       )
    )

  (tablamul 5 10)
  )

(define (ejercicio5)
  (define(pares n m sumar)
    (if(not(> n m))
       {begin
         (if(not(odd? n))
            {begin
              (display n)(display "\t")
              (pares (+ n 1)m(+ sumar n))}
            {begin
              (pares (+ n 1)m sumar)})}
       {begin
         (display "=   ")
         sumar}))

  (define(impares n m sumar)
    (if(not(> n m))
       {begin
         (if(odd? n)
            {begin
              (display n)(display "\t")
              (impares (+ n 1)m(+ sumar n))}
            {begin
              (impares (+ n 1)m sumar)})}
       {begin
         (display"=   ")
         sumar}))

  (define(lista n m)
    {begin
      (displayln "Lista de pares:")
      (displayln(pares n m 0))
      (displayln "Lista de impares: ")
      (displayln (impares n m 0))})

  (lista 5 10)

  )
(define (ejercicio1) ;Escrito por Juan Esteban García Pulgarín
  (define(primos n x k)
    (cond
      ((> k 2)0)
      ((and(<= x n)(=(modulo n x)0))
       (primos n(+ x 1)(+ k 1)))
      ((and(<= x n)(not(=(modulo n x)0)))
       (primos n(+ x 1)k))
      (else 1 )
      ))

  (define(primos? x)
    (primos x 1 0)
    )
  (define (sumarprimos n m cont)
    (cond
      ((= n m)
       [begin
         (cond
           ((= (primos? n) 1)
            [begin
              (displayln (+ cont n))
              ])
           (else (display cont))
           )
         ])
      (else
       [begin
         (cond
           ((= (primos? n)1)
            [begin
              (sumarprimos (+ n 1) m (+ cont n))
              ])
           (else (sumarprimos (+ n 1) m cont)))
         ])
      ))

  (define (sumarprimos. n m)
    (sumarprimos n m 0))

  (sumarprimos. 5 10)
  )

(define (principal) ;Escrito por Kevin Esguerra Cardona
  (displayln "Bienvenido: Profesor Luis Eduardo - ¿Qué ejercicio desea revisar?\nEjercicio 1\t(1)\nEjercicio 2\t(2)\nEjercicio 4\t(4)\nEjercicio 5\t(5)\nEjercicio 6\t(6)\nEjercicio 7\t(7)\nEjercicio 8\t(8)\nEjercicio 10\t(10)\n\n¿Salir sin ejecución?\t(0)")
  (define choose (read))
  (cond
    ((= choose 0)(display "--"))
    ((= choose 1) ;Escrito por Juan Esteban García Pulgarín
     (begin
       (displayln "Ejercicio 1: Sumar los números primos entre n y m (5->10) - Juan Esteban García Pulgarín\n")
       (ejercicio1)
       )
     )
    ((= choose 2) ;Escrito por Juan Pablo Sánchez
     (displayln "Ejercicio 2: Sumar los n a m términos de la sucesión de Fibonacci - Juan Pablo Sanchéz")
     (ejercicio2)
     )
    ((= choose 4) ;Escrito por Juan Miguel Árias Rios
     (displayln "Ejercicio 4: Mostrar las tablas de multiplciar de n a m (1->13) - Juan Miguel Árias Rios")
     (ejercicio4)
     )
    ((= choose 5) ;Escrito por Sofía Jaramillo Agudelo
     (displayln "Ejercicio 5: Sumar los pares e impares entre n y m (5->10) - Sofía Jaramillo Agudelo")
     (ejercicio5)
     )
    ((= choose 6) ;Escrito por Juan Esteban García Pulgarín
     (displayln "Ejercicio 6: Repeticiones de un dígito en un n dado - Juan Esteban García Pulgarín")
     (ejercicio6)
     )
    ((= choose 7)
     (displayln "Ejercicio 7: Encontrar los dos números mayores en una lista de números dada: (Aún no funciona) - Sofia Jaramillo Agudelo")
     (ejercicio7)
     );Sofía Jaramillo Agudelo
    ((= choose 8) ;Escrito por Sofia Jaramillo Agudelo & Juan Diego Leguizamo Fajardo
     (displayln "Ejercicio 8: Mostrar la tabla de multiplciar de los primos entre n y m (5->10) - Sofía Jaramillo Agudelo")
     (ejercicio8)
     )
    ((= choose 10) ;Escrito por Kevin Esguerra Cardona & Juan Diego Leguizamo Fajardo
     (displayln "Ejercicio 10: Encontrar el factorial de los primos de n a m (5->10) - Kevin Esguerra Cardona")
     (ejercicio10)
     )
    (else
     (printf "Opción desconocida (~a)\nRepitiendo\n" choose)
     (principal)
     )
    )
  )

(principal)