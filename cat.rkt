#!/usr/bin/env racket
#lang racket/base
; cat.rkt
; RNG cat
(require racket/file
         racket/cmdline)

(command-line
 #:args (file . others)
 (let [(lst-file (file->lines file))
       (lst-others (map file->lines others))]
   (for-each displayln lst-file)
   (for-each (λ (x) (for-each displayln x)) lst-others)))
