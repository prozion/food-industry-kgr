#!/bin/bash

# sort by location
# sort.rkt --by-key "place,__id" --order "a-z" --pars-order "alt,name,former-id,tsid,sid,abbr,place,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,raw,equipment,assets,repair,brand,vk,url,email,ip,proving-ground,ez,facilities-from,w,w-future,company,prod" --ignore-keys "a" --dest /home/denis/projects/food_industry_kgr/source/factories_by_place.tree /home/denis/projects/food_industry_kgr/source/facts/factories.tree

# sort by id name
sort.rkt --by-id a-z --pars-order "alt,name,former-id,tsid,sid,abbr,place,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,raw,equipment,assets,repair,brand,vk,url,email,ip,proving-ground,ez,facilities-from,w,w-future,company,prod" --ignore-keys "a" /home/denis/projects/food_industry_kgr/source/facts/factories.tree
