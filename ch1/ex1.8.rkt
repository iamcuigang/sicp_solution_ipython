#lang racket
(define (cube-root x)
  (cube-root-iter x 1.0 x))

(define (cube-root-iter last-guess guess x)
  (if (enuf? last-guess guess)
      guess
      (cube-root-iter guess (improve guess x) x)))

(define (enuf? x y)
  (< (/ (abs (- x y)) y) 0.001))

(define improve (lambda (y x)
                  (/ (+ (/ x (* y y)) (* 2 y)) 3)))

(display (cube-root 27))