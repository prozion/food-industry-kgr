#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)

(define places_russia_tt (parse-tabtree "/home/denis/projects/food-industry-kgr/places_russia.tree"))
(define places_world_tt (parse-tabtree "/home/denis/projects/food-industry-kgr/places_world.tree"))
(define places (hash-keys (t+ places_russia_tt places_world_tt)))

(define places_without_coors (->> (t+ places_world_tt places_russia_tt)
                                  hash-values
                                  (filter (λ (item) (equal? ($ a item) "loc/City")))
                                  (filter-not (λ (item) (and ($ lon item) ($ lat item))))
                                  (map (λ (item) ($ __id item)))))

(define places_without_pop (->> (t+ places_world_tt places_russia_tt)
                                  hash-values
                                  (filter (λ (item) (equal? ($ a item) "loc/City")))
                                  (filter-not (λ (item) (and ($ pop item))))
                                  (map (λ (item) ($ __id item)))))

(define objects_places (->>
                          (t+
                            (parse-tabtree "/home/denis/projects/capital-kgr/companies/companies.tree")
                            (parse-tabtree "/home/denis/projects/capital-kgr/factories/factories.tree")
                            (parse-tabtree "/home/denis/projects/capital-kgr/logistics/logistics.tree")
                            (parse-tabtree "/home/denis/projects/capital-kgr/companies/media_companies.tree")
                            (parse-tabtree "/home/denis/projects/capital-kgr/people/people.tree")
                            (parse-tabtree "/home/denis/projects/capital-kgr/companies/research_companies.tree")
                            (parse-tabtree "/home/denis/projects/capital-kgr/companies/trade_companies.tree")
                            )
                          hash-values
                          (map (λ (item) ($ place item)))
                          flatten
                          cleanmap
                          remove-duplicates))

(define new_places (join
                      places_without_coors
                      (minus objects_places places)))

; (--- places_without_coors)
(--- "New places: ")
(---- (sort new_places a-z))
; (--- "Places with undefined population: " (sort places_without_pop a-z))
