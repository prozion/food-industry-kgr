#!/bin/bash

# sort.rkt --by-f '(extend-numeric "w" max)' --pars-order "place,w" --ignore-keys "a,alt,sid,abbr,former-id,tsid,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,assets,prod,repair,brand,proving-ground,ip,facilities-from,parent,url" --dest /home/denis/projects/food_industry_kgr/source/factories_w.tree /home/denis/projects/food_industry_kgr/source/factories.tree

# sort.rkt --by-key "place,__id" --order "a-z" --pars-order "alt,former-id,tsid,sid,abbr,place,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,assets,repair,brand,url,ip,proving-ground,facilities-from,w,parent,prod" --ignore-keys "a" --dest /home/denis/projects/food_industry_kgr/source/factories_by_place.tree /home/denis/projects/food_industry_kgr/source/factories.tree

sort.rkt --by-id a-z --pars-order "alt,former-id,tsid,sid,abbr,place,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,assets,repair,brand,url,ip,proving-ground,facilities-from,w,parent,prod" --ignore-keys "a" /home/denis/projects/food_industry_kgr/source/factories.tree
