#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)
(require tabtree/rdf)

(define (compile-ttl input-tabtree output-turtle)
  (write-file output-turtle (tabtree->rdf (parse-tabtree input-tabtree))))

; (compile-ttl "/home/denis/projects/food-industry-kgr/source/food_industry.tree" "/home/denis/projects/food-industry-kgr/turtle/food_industry.ttl")

; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree.tree" "/home/denis/projects/ontologies/turtle/tabtree/core.ttl")
; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-abstract.tree" "/home/denis/projects/ontologies/turtle/tabtree/abstract.ttl")
; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-metrics.tree" "/home/denis/projects/ontologies/turtle/tabtree/metrics.ttl")
; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-time.tree" "/home/denis/projects/ontologies/turtle/tabtree/time.ttl")
; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-location.tree" "/home/denis/projects/ontologies/turtle/tabtree/location.ttl")
(compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-person.tree" "/home/denis/projects/ontologies/turtle/tabtree/person.ttl")
; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-organization.tree" "/home/denis/projects/ontologies/turtle/tabtree/organization.ttl")
; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-source.tree" "/home/denis/projects/ontologies/turtle/tabtree/source.ttl")
; (compile-ttl "/home/denis/projects/ontologies/tabtree/tabtree/tabtree-media.tree" "/home/denis/projects/ontologies/turtle/tabtree/media.ttl")
