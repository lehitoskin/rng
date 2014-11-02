#!/usr/bin/env racket
#lang racket/base
(require racket/file
         racket/cmdline)
; cat.rkt
; RNG cat

(command-line
 #:args (file . others)
 (let [(lst-file (file->lines file))
       (lst-others (map file->lines others))]
   (for-each displayln lst-file)
   (for-each (λ (x) (for-each displayln x)) lst-others)))
