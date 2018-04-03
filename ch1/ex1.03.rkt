#lang racket
(define (square x) (* x x))
(define (max x y)(if (< x y) y x))
(define (func x y z)
    (+ (square (max x y))
        (square (max (min x y) z))))

(display (func 1 2 3))