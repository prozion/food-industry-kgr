#!/bin/bash

sort.rkt --by-f '(extend-numeric "w" max)' --pars-order "place,w" --ignore-keys "a,alt,sid,abbr,former-id,tsid,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,assets,product,repair,brand,proving-ground,ip,facilities-from,parent" --dest /home/denis/projects/food-industry-kgr/source/factories_w.tree /home/denis/projects/food-industry-kgr/source/factories.tree

# sort.rkt --by-key "place,__id" --order "a-z" --pars-order "alt,former-id,tsid,sid,abbr,place,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,assets,repair,brand,ip,proving-ground,facilities-from,w,parent,product" --ignore-keys "a" --dest /home/denis/projects/food-industry-kgr/source/factories_by_place.tree /home/denis/projects/food-industry-kgr/source/factories.tree

# sort.rkt --by-id a-z --pars-order "alt,former-id,tsid,sid,abbr,place,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,assets,repair,brand,ip,proving-ground,facilities-from,w,parent,product" --ignore-keys "a" /home/denis/projects/food-industry-kgr/source/factories.tree
