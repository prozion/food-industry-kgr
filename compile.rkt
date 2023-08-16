#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)
(require tabtree/rdf)

(define (compile-ttl input-tabtree output-turtle)
  (write-file output-turtle (tabtree->rdf (parse-tabtree input-tabtree))))

(compile-ttl "/home/denis/projects/food-industry-kgr/food_industry.tree" "/home/denis/projects/food-industry-kgr/turtle/food_industry.ttl")
