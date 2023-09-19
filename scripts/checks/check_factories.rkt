#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)
(require tabtree/sorters)

; move to tabtree lib whan back to Ozery
(define (id* item)
  (flatten `(,(id item) ,($ alt item))))

(define (check-duplicated-ids tabtree)
  (let* (
        (duplicated-ids ($ duplicated-ids tabtree)))
    (for (((k v) duplicated-ids))
      (displayln (format "~a [~a]" k (implode v ", "))))))

(define (new-refs existed-refs-files refname)
  (let* ((get-existed-refs (λ (existed-refs-file)
                            (->>
                              existed-refs-file
                              parse-tabtree
                              hash-values
                              (filter (λ (item) ($ __parent item)))
                              (map id*)
                              flatten)))
        (existed-refs (if (list? existed-refs-files)
                        (->> existed-refs-files (map get-existed-refs) flatten remove-duplicates)
                        (get-existed-refs existed-refs-files)))
        (factory-tabtree (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories.tree"))
        (factory-cosmetics-tabtree (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories_cosmetics.tree"))
        (all-factories-tabtree (hash-union factory-tabtree factory-cosmetics-tabtree))
        (refs (->> all-factories-tabtree hash-values (map (λ (item) (hash-ref* item refname))) flatten remove-duplicates cleanmap)))
    (minus refs existed-refs)))

; remove this patch when back to Ozery!
(define (list->pretty-string lst (sep " "))
  (string-join (map ~a lst) sep))

(define new-products (sort (new-refs "/home/denis/projects/food_industry_kgr/source/taxonomies/products.tree" "prod") a-z))
(define new-companies (sort (new-refs (list
                                        "/home/denis/projects/food_industry_kgr/source/facts/companies.tree"
                                        "/home/denis/projects/food_industry_kgr/source/facts/retailers.tree" )
                                      "company")
                            a-z))
(define new-trademarks (sort (new-refs "/home/denis/projects/food_industry_kgr/source/facts/trademarks.tree" "tm") a-z))

(define factories_tt (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories.tree" #:parse-info #t))

(--- "Duplicated ids [lines]:")
(check-duplicated-ids factories_tt)

(--- "---------------------------------")
(--- "Uncategorized products:")
(--- (list->pretty-string new-products ", "))
(--- (format "Вcего: ~a" (length new-products)))

(--- "---------------------------------")
(--- "Undeclared companies:")
(--- (list->pretty-string new-companies ", "))
(--- (format "Вcего: ~a" (length new-companies)))

(--- "---------------------------------")
(--- "Undeclared trademarks:")
(--- (list->pretty-string new-trademarks ", "))
(--- (format "Вcего: ~a" (length new-trademarks)))
