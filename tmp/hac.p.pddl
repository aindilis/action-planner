(define (problem hac)

 (:domain hac)

 (:objects
  
  andrew-dougherty - person

  moms-bedroom andys-bedroom moms-bathroom moms-walkin-closet
  upstairs-hallway-closet andys-closet andys-bathroom upstairs-hallway
  upstairs-stairs livingroom guest-bathroom diningroom kitchen
  downstairs-stairs downstairs-hallway upstairs-hallway-closet
  crawlspace garage kitchen-pantry - room

  andys-computer-room - office

  laundry-machines - laundromat

  food-store - meals
  livingroom-couch andys-bed moms-bed - bed

  andys-bathroom-outlet moms-bathroom-outlet guest-bathroom-outlet
  andys-computer-room-outlet livingroom-outlet kitchen-outlet - outlet

  andys-shower moms-shower - shower
  columcille - laptop
  laptop-backpack - container

  grooming-kit - lockable-container

  woodmans-market jewel-osco whole-foods - store
  walmart-aurora walmart-batavia - store
  indian-trail-cvs - store

  electric-razor-0 - electric-razor
  laundry - laundry
  towel - towel
  finger-clippers towel shampoo hair-trimmers hair-brush - hygiene-tool
  can-opener wallet - stuff

  random-locker-0 - lockable-container

  )

 (:init
  (locked random-locker-0)
  (locked grooming-kit)

  (at 0 (inaccessible woodmans-market))
  (at 0 (inaccessible jewel-osco))
  (at 0 (inaccessible whole-foods))
  (at 0 (inaccessible walmart-aurora))
  (at 0 (inaccessible walmart-batavia))
  (at 0 (inaccessible indian-trail-cvs))
  (at 0 (not (inaccessible andys-bedroom)))
  (at 0 (not (inaccessible andys-computer-room)))
  (at 0 (not (inaccessible moms-bedroom)))
  (at 0 (not (inaccessible moms-bathroom)))
  (at 0 (not (inaccessible moms-walkin-closet)))
  (at 0 (not (inaccessible upstairs-hallway-closet)))
  (at 0 (not (inaccessible andys-closet)))
  (at 0 (not (inaccessible andys-bathroom)))
  (at 0 (not (inaccessible upstairs-hallway)))
  (at 0 (not (inaccessible upstairs-stairs)))
  (at 0 (not (inaccessible livingroom)))
  (at 0 (not (inaccessible guest-bathroom)))
  (at 0 (not (inaccessible diningroom)))
  (at 0 (not (inaccessible kitchen)))
  (at 0 (not (inaccessible downstairs-stairs)))
  (at 0 (not (inaccessible downstairs-hallway)))
  (at 0 (not (inaccessible upstairs-hallway-closet)))
  (at 0 (not (inaccessible crawlspace)))
  (at 0 (not (inaccessible garage)))
  (at 0 (not (inaccessible kitchen-pantry)))

  (at 7 (not (inaccessible woodmans-market)))
  (at 7 (not (inaccessible jewel-osco)))
  (at 7 (not (inaccessible whole-foods)))
  (at 7 (not (inaccessible walmart-aurora)))
  (at 7 (not (inaccessible walmart-batavia)))
  (at 7 (not (inaccessible indian-trail-cvs)))
  (at 21 (inaccessible woodmans-market))
  (at 21 (inaccessible jewel-osco))
  (at 21 (inaccessible whole-foods))
  (at 21 (inaccessible walmart-aurora))
  (at 21 (inaccessible walmart-batavia))
  (at 21 (inaccessible indian-trail-cvs))

  (= (quantity food-store) 10)



  (is-connected-to moms-bedroom moms-bathroom)
  (is-connected-to moms-bedroom moms-walkin-closet)
  (is-connected-to moms-bedroom upstairs-hallway)
  (is-connected-to andys-bedroom upstairs-hallway)
  (is-connected-to andys-bathroom upstairs-hallway)
  (is-connected-to upstairs-hallway upstairs-stairs)
  (is-connected-to upstairs-stairs livingroom)
  (is-connected-to downstairs-stairs livingroom)
  (is-connected-to guest-bathroom livingroom)
  (is-connected-to downstairs-stairs downstairs-hallway)
  (is-connected-to andys-computer-room downstairs-hallway)
  (is-connected-to crawlspace downstairs-hallway)
  (is-connected-to downstairs-hallway garage)
  (is-connected-to livingroom diningroom)
  (is-connected-to diningroom kitchen)
  (is-connected-to kitchen kitchen-pantry)

  (= (cash andrew-dougherty) 10)
  (= (hourly-wage-net andrew-dougherty) 30)

  (is-contained-by electric-razor-0 grooming-kit)
  (is-contained-by finger-clippers grooming-kit)

  (located-in laundry andys-closet)
  (located-in towel upstairs-hallway-closet)
  (located-in food-store kitchen-pantry)
  (located-in grooming-kit andys-bathroom)
  (located-in laundry-machines upstairs-hallway)
  (located-in andys-bed andys-bedroom)
  (isolated andys-bedroom)
  (isolated moms-bedroom)
  (located-in moms-bed moms-bedroom)
  (located-in livingroom-couch livingroom)
  (located-in andys-bathroom-outlet andys-bathroom)
  (located-in moms-bathroom-outlet moms-bathroom)
  (located-in guest-bathroom-outlet guest-bathroom)
  (located-in andys-computer-room-outlet andys-computer-room)
  (located-in livingroom-outlet livingroom)
  (located-in kitchen-outlet kitchen)
  (located-in andrew-dougherty andys-computer-room)
  (located-in columcille andys-computer-room)
  (located-in laptop-backpack andys-computer-room)

  (located-in andys-shower andys-bathroom)
  (located-in moms-shower moms-bathroom)

  (autonomous andrew-dougherty)

  ;; (mobile food-store)
  (mobile laptop-backpack)
  (mobile electric-razor-0)
  (mobile towel)
  (mobile laundry)
  (mobile columcille)
  (mobile finger-clippers)

  (tired andrew-dougherty)
  (hungry andrew-dougherty)

  (= (speed andrew-dougherty) 1)
  (= (actions) 0)
  (= (total-walking-distance) 0)

  (= (charge-level electric-razor-0) 0.1)
  (= (charge-rate electric-razor-0) 0.1)

  (= (charge-level columcille) 0.1)
  (= (charge-rate columcille) 0.3)

  (use-is-required finger-clippers)

  )

 (:goal 
  (and
   (>= (cash andrew-dougherty) 20)
   (all-pending-work-accomplished andrew-dougherty)
   (not (tired andrew-dougherty))
   (not (hungry andrew-dougherty))
   (not (use-is-required finger-clippers))
   (is-contained-by columcille laptop-backpack)
   (showered andrew-dougherty)
   (clean laundry)
  )
 )

 (:metric minimize (+
		    (+ 
		     (total-time) 
		     (actions))
		    (total-walking-distance)))

 )


