#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)
(require tabtree/rdf)

(define (compile-ttl input-tabtree output-turtle)
  (write-file output-turtle (tabtree->rdf (parse-tabtree input-tabtree))))

(compile-ttl "/home/denis/projects/food_industry_kgr/source/main.tree" "/home/denis/projects/food_industry_kgr/turtle/food_industry.ttl")

; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree.tree" "/home/denis/data/ontologies/turtle/tabtree/core.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-abstract.tree" "/home/denis/data/ontologies/turtle/tabtree/abstract.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-metrics.tree" "/home/denis/data/ontologies/turtle/tabtree/metrics.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-time.tree" "/home/denis/data/ontologies/turtle/tabtree/time.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-location.tree" "/home/denis/data/ontologies/turtle/tabtree/location.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-person.tree" "/home/denis/data/ontologies/turtle/tabtree/person.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-organization.tree" "/home/denis/data/ontologies/turtle/tabtree/organization.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-source.tree" "/home/denis/data/ontologies/turtle/tabtree/source.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-media.tree" "/home/denis/data/ontologies/turtle/tabtree/media.ttl")
; (compile-ttl "/home/denis/data/ontologies/tabtree/tabtree/tabtree-contacts.tree" "/home/denis/data/ontologies/turtle/tabtree/contacts.ttl")
