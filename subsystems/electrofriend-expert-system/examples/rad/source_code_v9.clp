
;;;======================================================
;;;   Registration Advice Expert System
;;;
;;;     This expert system will help students select
;;;     a quarterly schedule for the CSS dept. at UWB
;;;
;;;     CLIPS Version 6.0
;;;
;;;     To execute, merely load, reset and run.
;;;======================================================

;**************
;deftemplates *
;**************
(deftemplate courses "course characteristics"
  (slot course-number)
  (slot credits)
  (slot title)
  (slot concentration)
  (multislot prereq))

(deftemplate wschedule "Working Course schedule"
  (slot course-number)
  (slot starttime)
  (slot instructor)
  (multislot dow))

(deftemplate instructor "Instructor List"
  (slot instructor-num)
  (slot instructor-name)
  (slot instructor-rating)
  (slot instructor-personality))

(deftemplate courserating "Course rating"
  (slot course-number)
  (slot time-commitment)
  (slot course-rating))

(deftemplate completedcourses "Completed Courses"
  (slot studentID)
  (multislot course-number))

(deftemplate criteria "All curses that have been completed or removed by criteria"
  (multislot course-number))

(deftemplate course-to-be-eliminated "single courses selected to be eliminated based on criteria"
  (slot course-number))

(deftemplate user "Information about the user"
  (slot name)
  (slot studentID)
  (slot credithours)
  (slot collegestatus)
  (slot concentration))

;**************
;Deffacts     *
;**************
(deffacts css-completedcourses "Course completed by the student to-date"
  (completedcourses (studentID 9737479)
	(course-number css301 css342 css343 css350 css360 css370 css422 cssie447 cssie450 cssie490C cssap490D csssa445 cssie490D))

  (completedcourses (studentID 1234567)
	(course-number css301 css342 css343 cssap490A))

  (completedcourses (studentID 5555555)
	(course-number css301 css341 css422 css350 css360 css370 cssie450 cssie490A cssie490C))

  (completedcourses (studentID 9876543)
	(course-number )))

(deffacts css-courserating "Time commitment and course rating for each course"
  (courserating (course-number css301)
	(time-commitment 15)
	(course-rating average))
  (courserating (course-number css341)
	(time-commitment 10)
	(course-rating average))
  (courserating (course-number css342)
	(time-commitment 15)
	(course-rating average))
  (courserating(course-number css343)
	(time-commitment 15)
	(course-rating hard))
  (courserating (course-number css350)
	(time-commitment 7)
	(course-rating easy))
  (courserating (course-number css360)
	(time-commitment 8)
	(course-rating average))
  (courserating (course-number css370)
	(time-commitment 10)
	(course-rating easy))
  (courserating (course-number css422)
	(time-commitment 20)
	(course-rating hard))
  (courserating (course-number bls439)
	(time-commitment 7)
	(course-rating easy))
  (courserating (course-number css497)
	(time-commitment 20)
	(course-rating easy))
  (courserating (course-number cssap432)
	(time-commitment 15)
	(course-rating average))
  (courserating (course-number cssap443)
	(time-commitment 15)
	(course-rating hard))
  (courserating (course-number cssap490A)
	(time-commitment 20)
	(course-rating hard))
  (courserating (course-number cssap490B)
	(time-commitment 12)
	(course-rating hard))
  (courserating (course-number cssap490C)
	(time-commitment 10)
	(course-rating hard))
  (courserating (course-number cssie447)
	(time-commitment 10)
	(course-rating hard))
  (courserating (course-number cssie490B)
	(time-commitment 12)
	(course-rating hard))
  (courserating (course-number csssa445)
	(time-commitment 8)
	(course-rating hard))
  (courserating (course-number csssa471)
	(time-commitment 10)
	(course-rating average))
  (courserating (course-number csssa480)
	(time-commitment 10)
	(course-rating average))
  (courserating (course-number csssa490A)
	(time-commitment 10)
	(course-rating average))
  (courserating (course-number csssa490B)
	(time-commitment 10)
	(course-rating average))
  (courserating (course-number csssa490C)
	(time-commitment 10)
	(course-rating average)))

;**************
;Deffacts     *
;**************
;Instructor list for Computing and Software Systems
(deffacts instructor-list "List of current instructors at UWB"
  (instructor (instructor-name Kirk)
	(instructor-num 16)
	(instructor-rating hard)
	(instructor-personality average))
  (instructor (instructor-name Zander)
	(instructor-num 15)
	(instructor-rating hard)
	(instructor-personality average))
  (instructor (instructor-name Stiber)
	(instructor-num 14)
	(instructor-rating hard)
	(instructor-personality dry))
  (instructor (instructor-name Leong)
	(instructor-num 13)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Erdly)
	(instructor-num 12)
	(instructor-rating hard)
	(instructor-personality humorous))
  (instructor (instructor-name Peckol)
	(instructor-num 11)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Berg)
	(instructor-num 10)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Berger)
	(instructor-num 9)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Willcher)
	(instructor-num 8)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Kochanski)
	(instructor-num 7)
	(instructor-rating average)
	(instructor-personality humorous))
  (instructor (instructor-name Peck)
	(instructor-num 6)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Rasmussen)
	(instructor-num 5)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Bowden)
	(instructor-num 4)
	(instructor-rating average)
	(instructor-personality average))
  (instructor (instructor-name Jackels)
	(instructor-num 3)
	(instructor-rating hard)
	(instructor-personality average))
  (instructor (instructor-name Elledge)
	(instructor-num 2)
	(instructor-rating easy)
	(instructor-personality humorous))
  (instructor (instructor-name Sung)
	(instructor-num 1)
	(instructor-rating hard)
	(instructor-personality humorous)))

;**************
;Deffacts     *
;**************
;Working Schedule for Computing and Software Systems
;This list will be retracted as the expert system questions progress
(deffacts working-schedule "Working Schedule for the instructors of the CSS Courses"
;Monday Wednesday courses
  (wschedule (course-number csssa490A)
	(instructor Kirk)
	(starttime 1315)
	(dow Monday Wednesday))
  (wschedule (course-number css341)
	(instructor Berg)
	(starttime 1530)
	(dow Monday Wednesday))
  (wschedule (course-number css342)
	(instructor Zander)
	(starttime 1530)
	(dow Monday Wednesday))
  (wschedule (course-number cssie447)
	(instructor Stiber)
	(starttime 1530)
	(dow Monday Wednesday))
  (wschedule (course-number csssa490B)
	(instructor Leong)
	(starttime 1530)
	(dow Monday Wednesday))
  (wschedule (course-number css301)
	(instructor Kirk)
	(starttime 1745)
	(dow Monday Wednesday))
  (wschedule (course-number css350)
	(instructor Erdly)
	(starttime 1745)
	(dow Monday Wednesday))
  (wschedule (course-number cssap432)
	(instructor Peckol)
	(starttime 1745)
	(dow Monday Wednesday))
  (wschedule (course-number csssa445)
	(instructor Berg)
	(starttime 1745)
	(dow Monday Wednesday))
  (wschedule (course-number csssa490A)
	(instructor Leong)
	(starttime 1745)
	(dow Monday Wednesday))
  (wschedule (course-number css342)
	(instructor Zander)
	(starttime 2000)
	(dow Monday Wednesday))
  (wschedule (course-number css343)
	(instructor Stiber)
	(starttime 2000)
	(dow Monday Wednesday))
  (wschedule (course-number cssap490A)
	(instructor Berger)
	(starttime 2000)
	(dow Monday Wednesday))
  (wschedule (course-number csssa480)
	(instructor Willcher)
	(starttime 2000)
	(dow Monday Wednesday))

;Tuesday Thursday courses
  (wschedule (course-number css370)
	(instructor Kochanski)
	(starttime 1315)
	(dow Tuesday Thursday))
  (wschedule (course-number css301)
	(instructor Peck)
	(starttime 1530)
	(dow Tuesday Thursday))
  (wschedule (course-number cssap490B)
	(instructor Rassmussen)
	(starttime 1530)
	(dow Tuesday Thursday))
  (wschedule (course-number css422)
	(instructor Berger)
	(starttime 1745)
	(dow Tuesday Thursday))
  (wschedule (course-number cssap490C)
	(instructor Jackels)
	(starttime 1745)
	(dow Tuesday Thursday))
  (wschedule (course-number cssie490B)
	(instructor Kochanski)
	(starttime 1745)
	(dow Tuesday Thursday))
  (wschedule (course-number csssa471)
	(instructor Rasmussen)
	(starttime 1745)
	(dow Tuesday Thursday))
  (wschedule (course-number css360)
	(instructor Erdly)
	(starttime 2000)
	(dow Tuesday Thursday))
  (wschedule (course-number css370)
	(instructor Elledge)
	(starttime 2000)
	(dow Tuesday Thursday))
  (wschedule (course-number cssap443)
	(instructor Sung)
	(starttime 2000)
	(dow Tuesday Thursday)))

;**************
;Deffacts     *
;**************
;List of All courses for Computing and Software Systems
(deffacts css-courses "List of All Courses for Computing and Software Systems"
  (courses (course-number css301)
	(credits 5)
	(title "Technical Writing for Computing Professionals")
	(concentration core)
	(prereq "dept approval"))
  (courses (course-number css341)
	(credits 0)
	(title "Fundamentals of Programming Theory & Application")
	(concentration core)
	(prereq "dept approval"))
  (courses (course-number css342)
	(credits 5)
	(title "Mathematical Principles of Computing I")
	(concentration core)
	(prereq "dept approval"))
  (courses (course-number css343)
	(credits 5)
	(title "Mathematical Principles of Computing II")
	(concentration core)
	(prereq css342))
  (courses (course-number css350)
	(credits 5)
	(title "Management Principles of Computing Professionals")
	(concentration core))
  (courses (course-number css360)
	(credits 5)
	(title "Software Development & Quality Assurance")
	(concentration core)
	(prereq "dept approval" css343))
  (courses (course-number css370)
	(credits 5)
	(title "Process Reengineering")
	(concentration core))
  (courses (course-number css422)
	(credits 5)
	(title "Hardware Architecture & Operating Systems")
	(concentration core)
	(prereq css343))

;Miscellaneous Courses
  (courses (course-number bls439)
	(credits 5)
	(title "Computional Modeling & Visualization in Environmental Science")
	(concentration core))
  (courses (course-number css497)
	(title "Cooperative Education: Internship")
	(concentration core)
	(prereq "dept approval"))

;concentration = "Application Programming"
  (courses (course-number cssap432)
	(credits 5)
	(title "Networking & Distribution Systems")
	(concentration ap)
	(prereq css301 css422))
  (courses (course-number cssap443)
	(credits 5)
	(title "Advanced Programming methodologies II")
	(concentration ap)
	(prereq cssap442))
  (courses (course-number cssap490A)
	(credits 5)
	(title "Special Topics: Embedded Systems")
	(concentration ap)
	(prereq css422))
  (courses (course-number cssap490B)
	(credits 5)
	(title "Special Topics: Simulations Modeling")
	(concentration ap)
	(prereq css343))
  (courses (course-number cssap490C)
	(credits 5)
	(title "Special Topics: Computational Science & Modeling")
	(concentration ap)
	(prereq css341))
  (courses (course-number cssap490D)
	(credits 5)
	(title "Special Topics: Chip Fabication")
	(concentration ap)
	(prereq css343))

;concentration = "Information Engineering"
  (courses (course-number cssie447)
	(credits 5)
	(title "Programming Techniques for Information Engineering")
	(concentration ie)
	(prereq css301 css422))
  (courses (course-number cssie450)
	(credits 5)
	(title "The Graphical Display of Information")
	(concentration ie)
	(prereq css301 css422))
  (courses (course-number cssie490A)
	(credits 5)
	(title "Special Topics: Robotics")
	(concentration ie)
	(prereq css343))
  (courses (course-number cssie490B)
	(credits 5)
	(title "Special Topics: Information Management Techniques")
	(concentration ie)
	(prereq css342 css370))
  (courses (course-number cssie490C)
	(credits 5)
	(title "Special Topics: Neural Networks")
	(concentration ie)
	(prereq css343))
  (courses (course-number cssie490D)
	(credits 5)
	(title "Special Topics: E-commerce")
	(concentration ie)
	(prereq css343))

;concentration = "Systems Analysis"
  (courses (course-number csssa445)
	(credits 5)
	(title "Database Design & Reporting Techniques")
	(concentration sa)
	(prereq css370 css341))
  (courses (course-number csssa471)
	(credits 5)
	(title "The Business of Computing")
	(concentration sa))
  (courses (course-number csssa480)
	(credits 5)
	(title "Principles of Human Computer Interaction")
	(concentration sa))
  (courses (course-number csssa490A)
	(credits 5)
	(title "Special Topics: Women in Computing")
	(concentration sa))
  (courses (course-number csssa490B)
	(credits 5)
	(title "Special Topics: Software Applications in Engineering Design Firms")
	(concentration sa))
  (courses (course-number csssa490C)
	(credits 5)
	(title "Special Topics: Competitive Engineering")
	(concentration sa)))

(deffacts css-criteria "place holder"
  (criteria (course-number )))

;**************
;defrules     *
;**************
;************************************************************************************************
;start of general questions

(defrule start
	?init <- (initial-fact)
=>
	(retract ?init)
	(printout t crlf "What is your first name?")
	(printout t crlf "Answer>")
	(assert (user (name (read))))
	(assert (question 1)))

(defrule question1
	?q <- (question 1)
	?user <- (user (studentID nil))
=>
	(retract ?q)
	(printout t crlf "What is your student ID number? ")
	(printout t crlf "Answer>")
	(bind ?answer (read))
	(modify ?user (studentID ?answer))
	(assert (question 2)))

(defrule question2
	?q <- (question 2)
	?user <- (user (collegestatus nil))
=>
	(retract ?q)
	(printout t crlf "What is your college status (third, fourth, fifth)?")
	(printout t crlf "Answer>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ third fourth fifth 3 4 5 3rd 4th 5th junior senior)))
		then
		(assert (question 2))
		else
		(if (member ?answer (create$ third 3 3rd junior))
			then
			(modify ?user (collegestatus Junior)))
		(if (member ?answer (create$ fourth 4 4th senior))
			then
			(modify ?user (collegestatus Senior)))
		(if (member ?answer (create$ fourth fifth 5 5th))
			then
			(modify ?user (collegestatus "Fifth Year")))
		(assert (question 3))))

(defrule question3
	?q <- (question 3)
	?user <- (user (concentration nil))
=>
	(retract ?q)
	(printout t crlf "What is your concentration (ap, ie, sa or undecided)?")
	(printout t crlf "Answer>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ ap ie sa undecided)))
		then
		(assert (question 3))
		else
		(if (eq ?answer ap)
			then
			(modify ?user (concentration "Application Programming")))
		(if (eq ?answer ie)
			then
			(modify ?user (concentration "Information Engineering")))
		(if (eq ?answer sa)
			then
			(modify ?user (concentration "Systema Analysis")))
		(if (eq ?answer undecided)
			then
			(modify ?user (concentration "Undecided")))
		(assert (question 4))))

(defrule question4
	?q <- (question 4)
=>
	(retract ?q)
	(printout t crlf "CSS department approval is required for some courses do you have it(yes/no)?")
	(printout t crlf "Answer>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ yes no y n)))
		then
		(assert (question 4))
		else
		(if (or(eq ?answer yes)(eq ?answer y))
			then
			(assert (approval "dept approval"))
			else
			(assert (approval "")))
		(assert (question 5))))

(defrule question5
	?q <- (question 5)
	?user <- (user (name ?uname)(studentID ?uid)(credithours nil))
=>
	(retract ?q)
	(printout t crlf "How many credits will you be taking this quarter?")
	(printout t crlf "Answer>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (> ?answer 20)
		then
		(printout t "Credits " ?answer " greater than allowed." crlf)
		(assert (question 5))
		else
		(modify ?user (credithours ?answer))
	      (bind ?count 0)
	      (while (<= ?count 22)
	     	  (printout t crlf)
	        (bind ?count (+ ?count 1)))
		(printout t "Name: " ?uname crlf)
		(printout t "Student ID: " ?uid crlf crlf)
		(printout t "To date our records show these courses completed." crlf)
		(printout t "They will be eliminated from RAD. " crlf crlf)
		(assert (print data))))

;courses eliminated by general questions
(defrule completed-course-names
	(user (studentID ?id))
	(courses (course-number ?cname)(title ?tname))
	(print data)
	?c <- (completedcourses (studentID ?id)(course-number ?cname $?rest))
=>
	(retract ?c)
	(assert (enter-prompt 5))
	(assert (course-to-be-eliminated (course-number ?cname)))
	(assert (completedcourses (studentID ?id)(course-number $?rest)))
	(format t "  %-10s %-2s %n" ?cname ?tname))

;displays the prompt for question #5
(defrule enter-prompt
	?p <- (print data)
	?t <- (enter-prompt 5)
=>
	(retract ?p ?t)
	(printout t crlf "Press any letter to continue")
	(printout t crlf crlf "Preference>")
	(bind ?answer (read))
	(assert (menu start)))

;end of general questions
;************************************************************************************************
;start of the menu system

(defrule question6
	?t <- (menu start)
=>
	(retract ?t)
      (bind ?count 0)
      (while (<= ?count 22)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "           Registartion Advice Menu" crlf crlf)
	(printout t "Select  Description" crlf)
	(printout t "------------------------------------------------------")
	(printout t crlf)
	(format t "  %-5s %-2s %n" "1" "Identify days unable to attend courses")
	(format t "  %-5s %-2s %n" "2" "Identify times unable to attend courses")
	(format t "  %-5s %-2s %n" "3" "Identify courses based on concentration only")
	(format t "  %-5s %-2s %n" "4" "Identify courses based on non-preferred instructor")
	(format t "  %-5s %-2s %n" "5" "Identify courses based on time commitment")
	(format t "  %-5s %-2s %n" "6" "Retract previous criteria")
	(format t "  %-5s %-2s %n" "7" "View preferred courses based on criteria")
	(format t "  %-5s %-2s %n" "X" "EXIT")
	(printout t crlf "Preference>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ 1 2 3 4 5 6 7 x)))
		then
		(assert (menu start))
		else
;		(if (eq ?answer 6)
;			then
;			(assert (dow-conflict ))
;			(assert (time-conflict ))
;			(assert (concentration-choice ))
;			(assert (instructor-num ))
;			(assert (time-commitment )))
;		(assert (preference ?answer))))
		(assert (preference ?answer)))

;*****************************************************
;question #1 main menu
(defrule dow-conflict-criteria
	?t <- (preference 1)
=>
	(retract ?t)
      (bind ?count 0)
      (while (<= ?count 25)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "           Non-preferred course days" crlf crlf)
	(printout t "Select  Description" crlf)
	(printout t "------------------------------------------------------")
	(printout t crlf)
	(format t "  %-5s %-2s %n" "1" "Monday-Wednesday")
	(format t "  %-5s %-2s %n" "2" "Tuesday-Thursday")
	(format t "  %-5s %-2s %n" "3" "Friday")
	(format t "  %-5s %-2s %n" "X" "Return to main menu")
	(printout t crlf "Preference>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ 1 2 3 x)))
		then
		(assert (preference 1))
		else
	     (assert (menu start))
		(if (eq ?answer 1)
			then (assert (dow-conflict Monday)))
		(if (eq ?answer 2)
			then (assert (dow-conflict Tuesday)))
		(if (eq ?answer 3)
			then (assert (dow-conflict Friday)))))

;courses eliminated by question #1 of main menu
(defrule bad-dow-course-names
	(logical (dow-conflict ?dname))
	?w <- (wschedule (course-number ?cname)(dow ?dname $?rest))
=>
	(assert (course-to-be-eliminated (course-number ?cname)))
	(format t "  %-10s %-2s %n" ?cname ?dname))

;*****************************************************
;question #2 of main menu
(defrule time-conflict-criteria
	?t <- (preference 2)
=>
	(retract ?t)
      (bind ?count 0)
      (while (<= ?count 25)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "           Non-preferred course start times" crlf crlf)
	(printout t "Select  Description" crlf)
	(printout t "------------------------------------------------------")
	(printout t crlf)
	(format t "  %-5s %-2s %n" "1" "1:15 P.M.")
	(format t "  %-5s %-2s %n" "2" "3:30 P.M.")
	(format t "  %-5s %-2s %n" "3" "5:45 P.M.")
	(format t "  %-5s %-2s %n" "4" "8:00 P.M.")
	(format t "  %-5s %-2s %n" "X" "Return to main menu")
	(printout t crlf "Preference>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ 1 2 3 4 x)))
		then
		(assert (preference 2))
		else
	     (assert (menu start))
		(if (eq ?answer 1)
			then (assert (time-conflict 1315)))
		(if (eq ?answer 2)
			then (assert (time-conflict 1530)))
		(if (eq ?answer 3)
			then (assert (time-conflict 1745)))
		(if (eq ?answer 4)
			then (assert (time-conflict 2000)))))

;courses eliminated by question #2 main menu
(defrule bad-time-course-names
	(logical (time-conflict ?ctime))
	?w <- (wschedule (course-number ?cname)(starttime ?ctime))
=>
	(assert (course-to-be-eliminated (course-number ?cname)))
	(format t "  %-10s %-2d %n" ?cname ?ctime))

;*****************************************************
;question #3 main menu 
(defrule concentration-criteria
	?t <- (preference 3)
=>
	(retract ?t)
      (bind ?count 0)
      (while (<= ?count 25)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "        Select Courses based on Concentration" crlf crlf)
	(printout t "Select  Description" crlf)
	(printout t "------------------------------------------------------")
	(printout t crlf)
	(format t "  %-5s %-2s %n" "1" "Core Only")
	(format t "  %-5s %-2s %n" "2" "Application Programming")
	(format t "  %-5s %-2s %n" "3" "Information Engineering")
	(format t "  %-5s %-2s %n" "4" "Systems Analyst")
	(format t "  %-5s %-2s %n" "X" "Return to main menu")
	(printout t crlf "Preference>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ 1 2 3 4 x)))
		then
		(assert (preference 3))
		else
	     (assert (menu start))
		(if (eq ?answer 1)
			then (assert (concentration-choice core)))
		(if (eq ?answer 2)
			then (assert (concentration-choice ap)))
		(if (eq ?answer 3)
			then (assert (concentration-choice ie)))
		(if (eq ?answer 4)
			then (assert (concentration-choice sa)))))

;courses eliminated by question #3 of main menu
(defrule bad-concentration-course-names
	(logical (concentration-choice ?dname))
	(courses (course-number ?cname)(concentration ?tname))
	(wschedule (course-number ?cname))
=>
	(if (not (eq ?dname ?tname))
		then
	  	(assert (course-to-be-eliminated (course-number ?cname)))
		(format t "  %-10s %-2s %n" ?cname ?tname)))

;*****************************************************
;question #4 main menu 
(defrule instructor-preference-criteria
	?p <- (preference 4)
=>
	(retract ?p)
      (bind ?count 0)
      (while (<= ?count 25)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "           Non-preferred Instructor" crlf crlf)
	(printout t "Select  Instructors" crlf)
	(printout t "------------------------------------------------------")
	(printout t crlf)
	(format t "  %-5s %-2s %n" "1" "Sung")
	(format t "  %-5s %-2s %n" "2" "Elledge")
	(format t "  %-5s %-2s %n" "3" "Jackels")
	(format t "  %-5s %-2s %n" "4" "Bowden")
	(format t "  %-5s %-2s %n" "5" "Rasmussen")
	(format t "  %-5s %-2s %n" "6" "Peck")
	(format t "  %-5s %-2s %n" "7" "Kochanski")
	(format t "  %-5s %-2s %n" "8" "Willcher")
	(format t "  %-5s %-2s %n" "9" "Berger")
	(format t "  %-5s %-2s %n" "10" "Berg")
	(format t "  %-5s %-2s %n" "11" "Peckol")
	(format t "  %-5s %-2s %n" "12" "Erdly")
	(format t "  %-5s %-2s %n" "13" "Leong")
	(format t "  %-5s %-2s %n" "14" "Stiber")
	(format t "  %-5s %-2s %n" "15" "Zander")
	(format t "  %-5s %-2s %n" "16" "Kirk")
	(format t "  %-5s %-2s %n" "X" "Return to main menu")
	(printout t crlf "Preference>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 x)))
		then
		(assert (preference 4))
		else
	      (assert (menu start))
		(assert (instructor-num ?answer))))

;courses eliminated by question #4 main menu
(defrule bad-instructor-names
	(logical (instructor-num ?inum))
	(instructor (instructor-num ?inum)(instructor-name ?iname))
	(wschedule (course-number ?cname)(instructor ?iname)(starttime ?stime))
=>
	(assert (course-to-be-eliminated (course-number ?cname)))
	(format t "  %-10s %-2d %n" ?cname ?stime))

;*****************************************************
;question #5 main menu 
(defrule time-commitment-criteria
	?t <- (preference 5)
=>
	(retract ?t)
      (bind ?count 0)
      (while (<= ?count 25)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "           Preferred course time commitment" crlf crlf)
	(printout t "Select  Description" crlf)
	(printout t "------------------------------------------------------")
	(printout t crlf)
	(format t "  %-5s %-2s %n" "1" "Easy")
	(format t "  %-5s %-2s %n" "2" "Fair")
	(format t "  %-5s %-2s %n" "3" "Typical")
	(format t "  %-5s %-2s %n" "4" "Laborious")
	(format t "  %-5s %-2s %n" "X" "Return to main menu")
	(printout t crlf "Preference>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ 1 2 3 4 x)))
		then
		(assert (preference 5))
		else
	      (assert (menu start))
		(if (eq ?answer 1)
			then (assert (time-commitment 8)))
		(if (eq ?answer 2)
			then (assert (time-commitment 12)))
		(if (eq ?answer 3)
			then (assert (time-commitment 16)))
		(if (eq ?answer 4)
			then (assert (time-commitment 20)))))

;courses eliminated by question #5 main menu
(defrule bad-time-commitment-names
	(logical (time-commitment ?rtime))
	?c <- (courserating (course-number ?cname)(time-commitment ?ctime))
	?w <- (wschedule (course-number ?cname)(starttime ?stime))
=>
	(if (> ?ctime ?rtime)
		then
		(assert (course-to-be-eliminated (course-number ?cname)))
		(format t "  %-10s %-2d %n" ?cname ?stime)))

;retracts user selected criteria
;question #6 main menu 
(defrule retract-criteria
	?t   <- (preference 6)
	?dow <- (dow-conflict $?)
	?tc  <- (time-conflict $?)
	?cc  <- (concentration-choice $?)
	?ic  <- (instructor-num $?)
	?tcm <- (time-commitment $?)
=>
	(retract ?t)
      (bind ?count 0)
      (while (<= ?count 25)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "           Retract Criteria Selection" crlf crlf)
	(printout t "Select  Description" crlf)
	(printout t "------------------------------------------------------")
	(printout t crlf)
	(format t "  %-5s %-2s %n" "1" "Retract all day criteria")
	(format t "  %-5s %-2s %n" "2" "Retract all times criteria")
	(format t "  %-5s %-2s %n" "3" "Retract all concentration criteria")
	(format t "  %-5s %-2s %n" "4" "Retract all instructor criteria")
	(format t "  %-5s %-2s %n" "5" "Retract all time commitment criteria")
	(format t "  %-5s %-2s %n" "X" "Return to main menu")
	(printout t crlf "Preference>")
	(bind ?answer (read))
	(if (lexemep ?answer)
		then (bind ?answer (lowcase ?answer)))
	(if (not (member ?answer (create$ 1 2 3 4 5 x)))
		then
		(assert (preference 6))
		else
	      (assert (menu start))
		(if (eq ?answer 1)
			then (retract ?dow))
		(if (eq ?answer 2)
			then (retract ?tc))
		(if (eq ?answer 3)
			then (retract ?cc))
		(if (eq ?answer 4)
			then (retract ?ic))
		(if (eq ?answer 5)
			then (retract ?tcm))))

;************************************************************************************************
;in-work
;************************************************************************************************

;*****************************************************
;question #7 main menu 
(defrule view-course-data
	?t <- (preference 7)
	(user (name ?uname)(studentID ?uid)(credithours ?uhours)(collegestatus ?ustat)(concentration ?ucon))
	(approval ?app)
=>
	(retract ?t)
      (bind ?count 0)
      (while (<= ?count 25)
     	  (printout t crlf)
        (bind ?count (+ ?count 1)))
	(printout t "Name: " ?uname crlf)
	(printout t "Student ID: " ?uid crlf)
	(printout t "Concentration: " ?ucon crlf)
	(printout t "College Status: " ?ustat crlf)
	(if (eq ?app "dept approval")
		then
		(printout t "Department Approval: Yes" crlf crlf)
		else
		(printout t "Department Approval: No" crlf crlf))
	(printout t "           View courses based on Criteria" crlf crlf)
	(printout t " Days                  Time    Course #      Title" crlf)
	(printout t "----------------------------------------------------------------------------")
	(printout t crlf)
	(assert (convert next)))

;convert data
(defrule convert-data
	(convert next)
	?e <- (course-to-be-eliminated (course-number ?cname))
	?c <- (criteria (course-number $?rest))
=>
	(retract ?c ?e)
	(assert (app next))
	(assert (criteria (course-number ?cname $?rest))))

;approval data
(defrule approval-data
	(app next)
	?e <- (approval ?cname)
	?c <- (criteria (course-number $?rest))
=>
	(retract ?c ?e)
	(assert (pref next))
	(assert (criteria (course-number ?cname $?rest))))

;displays the instructor info for question #7
(defrule view-data
	(pref next)
	?w <- (wschedule (course-number ?wname)(instructor ?iname)(starttime ?wtime)(dow ?wdow ?rest))
	(criteria (course-number $?cname))
	(courses (course-number ?wname)(title ?ctitle)(prereq $?pname))
=>
	(retract ?w)
	(if (and (not (member$ ?wname $?cname))(subsetp $?pname $?cname))
		then
		(format t " %-8s %-12s %-7d %-13s %-2s %n" ?wdow ?rest ?wtime ?wname ?ctitle)))
	
