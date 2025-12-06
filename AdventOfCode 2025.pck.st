'From Cuis7.5 [latest update: #7739] on 6 December 2025 at 1:17:14 pm'!
'Description '!
!provides: 'AdventOfCode 2025' 1 5!
SystemOrganization addCategory: #'AdventOfCode 2025'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 1'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 2'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 3'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 4'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 5'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 6'!


!classDefinition: #DayOne2025 category: #'AdventOfCode 2025-Day 1'!
Object subclass: #DayOne2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 1'!
!classDefinition: 'DayOne2025 class' category: #'AdventOfCode 2025-Day 1'!
DayOne2025 class
	instanceVariableNames: ''!

!classDefinition: #DayTwo2025 category: #'AdventOfCode 2025-Day 2'!
Object subclass: #DayTwo2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 2'!
!classDefinition: 'DayTwo2025 class' category: #'AdventOfCode 2025-Day 2'!
DayTwo2025 class
	instanceVariableNames: ''!

!classDefinition: #DayThree2025 category: #'AdventOfCode 2025-Day 3'!
Object subclass: #DayThree2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 3'!
!classDefinition: 'DayThree2025 class' category: #'AdventOfCode 2025-Day 3'!
DayThree2025 class
	instanceVariableNames: ''!

!classDefinition: #DayFour2025 category: #'AdventOfCode 2025-Day 4'!
Object subclass: #DayFour2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 4'!
!classDefinition: 'DayFour2025 class' category: #'AdventOfCode 2025-Day 4'!
DayFour2025 class
	instanceVariableNames: ''!

!classDefinition: #DayFive2025 category: #'AdventOfCode 2025-Day 5'!
Object subclass: #DayFive2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 5'!
!classDefinition: 'DayFive2025 class' category: #'AdventOfCode 2025-Day 5'!
DayFive2025 class
	instanceVariableNames: ''!

!classDefinition: #DaySix2025 category: #'AdventOfCode 2025-Day 6'!
Object subclass: #DaySix2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 6'!
!classDefinition: 'DaySix2025 class' category: #'AdventOfCode 2025-Day 6'!
DaySix2025 class
	instanceVariableNames: ''!

!classDefinition: #Problem category: #'AdventOfCode 2025-Day 6'!
Object subclass: #Problem
	instanceVariableNames: 'numbers operator result operation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 6'!
!classDefinition: 'Problem class' category: #'AdventOfCode 2025-Day 6'!
Problem class
	instanceVariableNames: ''!


!DayOne2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 2/Dec/2025 22:49:00'!
calculateMethodPassword

	| zeroCounter comingFromZero currentDialPosition |

	zeroCounter := 0.
	comingFromZero := 0.
	currentDialPosition := 50.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/1/input' asFileEntry 
		readStreamDo: [:fileStream|
				[fileStream atEnd] whileFalse: [ |line direction clicks |
						line := fileStream nextLine.
						direction := line first asString.
						clicks := (line copyFrom: 2 to: line size) asNumber.
						(direction = 'R') ifTrue: [
								currentDialPosition := currentDialPosition + clicks.
							].
						(direction = 'L') ifTrue: [
								currentDialPosition := currentDialPosition - clicks.
							].
						(currentDialPosition > 0)
							ifTrue: [
									zeroCounter := zeroCounter + (currentDialPosition div: 100).
									currentDialPosition := currentDialPosition rem: 100.
									(currentDialPosition = 0) ifTrue: [comingFromZero := 1 ] ifFalse: [comingFromZero := 0].
								]
							ifFalse: [
									(currentDialPosition = 0)
										ifTrue: [
												zeroCounter := zeroCounter + 1.
												comingFromZero := 1.
											]
										ifFalse: [
												[currentDialPosition <= 0] whileTrue: [
														currentDialPosition := currentDialPosition + 100.
														zeroCounter := zeroCounter + 1 - comingFromZero.
														comingFromZero := 0.
													].
												
												(currentDialPosition = 100) ifTrue: [currentDialPosition := 0. comingFromZero := 1].
											].
									
								].
						"Transcript show: direction, clicks asString, ' => ', currentDialPosition asString, ', zero: ', zeroCounter asString; cr."
					].
			].
	^ zeroCounter.! !

!DayOne2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 2/Dec/2025 22:54:00'!
calculatePassword

	| zeroCounter comingFromZero currentDialPosition |

	zeroCounter := 0.
	comingFromZero := 0.
	currentDialPosition := 50.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/1/input' asFileEntry 
		readStreamDo: [:fileStream|
				[fileStream atEnd] whileFalse: [ |line direction clicks |
						line := fileStream nextLine.
						direction := line first asString.
						clicks := (line copyFrom: 2 to: line size) asNumber.
						(direction = 'R') ifTrue: [
								currentDialPosition := currentDialPosition + clicks.
							].
						(direction = 'L') ifTrue: [
								currentDialPosition := currentDialPosition - clicks.
							].
						(currentDialPosition < 0) ifTrue: [ currentDialPosition := (currentDialPosition rem: 100) + 100 ].
						(currentDialPosition >= 0) ifTrue: [ currentDialPosition := currentDialPosition rem: 100 ].
						(currentDialPosition = 0) ifTrue: [ zeroCounter := zeroCounter + 1].
						"Transcript show: direction, clicks asString, ' => ', currentDialPosition asString, ', zero: ', zeroCounter asString; cr."
					].
			].
	^ zeroCounter.! !

!DayTwo2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 2/Dec/2025 22:57:00'!
findAdditionalInvalidProductIds

	| invalidIds sum |
	invalidIds := OrderedCollection new.
	sum := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/2/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ |line |
			line := fileStream nextLine.
			(line findTokens: ',') do: [ :range |
				| boundaries |
				boundaries := (range findTokens: '-').
				(boundaries at: 1) asNumber to: (boundaries at: 2) asNumber do: [ :id |
					| label invalidId|
					label := id asString.
					invalidId := false.
					(label size - 1) to: 1 by: -1 do: [ :chunkSize |
						| chunks |
						(((label size) rem: chunkSize) = 0) ifTrue: [
							chunks := self splitString: label chunkSize: chunkSize.
							(chunks allSatisfy: [ :elem | elem = (chunks first) ]) ifTrue: [ invalidId := true ].
							].
						].
					invalidId ifTrue: [ invalidIds add: label ].
					].
				].
			].
		].

	"
	Transcript show: 'Invalid IDs:'; cr.
	invalidIds do: [ :invalidId |
		Transcript show: invalidId; cr.
		].
	"
	
	invalidIds do: [ :invalidId |
		sum := sum + invalidId asNumber.
		].
	^ sum.! !

!DayTwo2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 2/Dec/2025 21:53:00'!
findInvalidProductIds

	| invalidIds sum |
	invalidIds := OrderedCollection new.
	sum := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/2/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ |line |
			line := fileStream nextLine.
			(line findTokens: ',') do: [ :range |
				| boundaries |
				boundaries := (range findTokens: '-').
				(boundaries at: 1) asNumber to: (boundaries at: 2) asNumber do: [ :id |
					| label |
					label := id asString.
					label size even ifTrue: [
						| mid left right|
						mid := label size div: 2.
						left := label copyFrom: 1 to: mid.
						right := label copyFrom: mid + 1 to: label size.
						(left = right) ifTrue: [ invalidIds add: label. ].
					].
				].
			].
		].
	].

	"
	Transcript show: 'Invalid IDs:'; cr.
	invalidIds do: [ :invalidId |
		Transcript show: invalidId; cr.
		].
	"
	
	invalidIds do: [ :invalidId |
		sum := sum + invalidId asNumber.
		].
	^ sum.! !

!DayTwo2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 2/Dec/2025 22:13:00'!
splitString: string chunkSize: chunkSize

	| result size |
	
	result := OrderedCollection new.
	size := string size.
	
	1 to: size by: chunkSize do: [ :index |
		result add: (string copyFrom: index to: index + chunkSize - 1)
		].
	
	^ result.! !

!DayThree2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 3/Dec/2025 08:50:49'!
totalJoltage

	| banks totalJolts |
	banks := OrderedCollection new.
	totalJolts := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/3/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [
			|line bank |
			bank := OrderedCollection new.
			line := fileStream nextLine.
			line do: [ :battery | bank add: battery digitValue ].
			banks add: bank.
			].
		].
	banks do: [ :bank |
		| jolts |
		jolts := OrderedCollection new.
		1 to: bank size - 1 do: [ :i |
				(i + 1) to: bank size do: [ :j |
				jolts add: ((10 * (bank at: i)) + (bank at: j))
				].
			].
		jolts sort.
		"
		Transcript show: bank; show: ' has highes jolt: '; show: jolts last; cr.
		"
		totalJolts := totalJolts + jolts last.
		].

	^ totalJolts.! !

!DayThree2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 3/Dec/2025 18:58:49'!
totalJoltageOverride

	| banks totalJolts |
	banks := OrderedCollection new.
	totalJolts := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/3/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [
			|line bank |
			bank := OrderedCollection new.
			line := fileStream nextLine.
			line do: [ :battery | bank add: battery digitValue ].
			banks add: bank.
			].
		].
	banks do: [ :bank |
		| batteries index |
		batteries := String new: 12.
		index := 0.
		
		1 to: 12 do: [ :battery |
			| currentJolt maxJolt |
			currentJolt := 0.
			maxJolt := 0.
			(index + 1) to: bank size - (batteries size - battery) do: [ :i |
				currentJolt := bank at: i.
				(currentJolt > maxJolt) ifTrue: [ maxJolt := currentJolt. index := i ].
				].
			batteries at: battery put: (Character digitValue: maxJolt).
			].		
		"		
		Transcript show: bank; show: ' has highes jolt: '; show: batteries; cr.
		"
		totalJolts := totalJolts + batteries asNumber.
		].

	^ totalJolts.! !

!DayFour2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 4/Dec/2025 23:32:24'!
findAccesibleRoles

	| grid count |
	grid := OrderedCollection new.
	count := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/4/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line |
			line := fileStream nextLine.
			grid add: line.
			].
		].
	
	1 to: grid size do: [ :i |
		1 to: (grid at: i) size do: [ :j |
			(self isRoleAccesibleOn: grid at: i and: j) ifTrue: [ count := count + 1 ].
			].
		].

	^ count.! !

!DayFour2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 4/Dec/2025 23:52:18'!
findAndRemoveAccesibleRoles

	| grid totalCount |
	grid := OrderedCollection new.
	totalCount := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/4/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line |
			line := fileStream nextLine.
			grid add: line.
			].
		].

	[ | count |
		count := 0.	
		1 to: grid size do: [ :i |
			1 to: (grid at: i) size do: [ :j |
				(self isRoleAccesibleOn: grid at: i and: j) ifTrue: [ count := count + 1. (grid at: i) at: j put: $. ].
				].
			].
		totalCount := totalCount + count.
		(count > 0).
	] whileTrue.

	^ totalCount.! !

!DayFour2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 4/Dec/2025 23:48:41'!
isRoleAccesibleOn: grid at: x and: y
	
	| count roleAccesible |
	
	count := 0.
	roleAccesible := false.
		
	(self isRoleOn: grid at: x and: y) ifTrue: [
		(self isRoleOn: grid at: x-1 and: y-1) ifTrue: [ count := count + 1].
		(self isRoleOn: grid at: x-1 and: y) ifTrue: [ count := count + 1].
		(self isRoleOn: grid at: x-1 and: y+1) ifTrue: [ count := count + 1].
		(self isRoleOn: grid at: x and: y-1) ifTrue: [ count := count + 1].
		(self isRoleOn: grid at: x and: y+1) ifTrue: [ count := count + 1].
		(self isRoleOn: grid at: x+1 and: y-1) ifTrue: [ count := count + 1].
		(self isRoleOn: grid at: x+1 and: y) ifTrue: [ count := count + 1 ].
		(self isRoleOn: grid at: x+1 and: y+1) ifTrue: [ count := count + 1].
		
		roleAccesible := (count < 4).
		].
	
	^ roleAccesible.! !

!DayFour2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 4/Dec/2025 23:49:55'!
isRoleOn: grid at: x and: y
	
	| role |

	role := false.
	
	((x > 0) and: (x <= grid size)) ifTrue: [
		((y > 0) and: (y <= (grid at: x) size)) ifTrue: [
			role := (((grid at: x) at: y) = $@).
			].
		].
	
	^ role.! !

!DayFive2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 00:33:48'!
countFreshIngredientIDs

	| inventory unifiedInventory count mode |
	inventory := OrderedCollection new.
	unifiedInventory := OrderedCollection new.
	count := 0.
	mode := #INGREDIENT_ID_RANGES.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/5/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line |
			line := fileStream nextLine.
			(line size = 0)
				ifTrue: [ 
					mode := #AVAILABLE_INGREDIENT_IDS
					]
				ifFalse: [
					(mode = #INGREDIENT_ID_RANGES) ifTrue: [ | range |
						range := line findTokens: '-'.
						inventory add: (Point x: (range at: 1) asNumber y: (range at: 2) asNumber).
						].
					(mode = #AVAILABLE_INGREDIENT_IDS) ifTrue: [
						].
				].
			].
		].

	[
		| range index needToBeUnified |
		range := inventory removeFirst.
		index := 0.
		needToBeUnified := false.

		[
			| potentialOverlappingRange |
			
			index := index + 1.
			
			(inventory size > 0) ifTrue: [
				potentialOverlappingRange := inventory at: index.
				((potentialOverlappingRange x to: potentialOverlappingRange y) includes: range x) ifTrue: [ needToBeUnified := true ].
				((potentialOverlappingRange x to: potentialOverlappingRange y) includes: range y) ifTrue: [ needToBeUnified := true ].
				].
			
			(needToBeUnified = false) & (index < inventory size).
			] whileTrue.
			
		needToBeUnified
			ifTrue: [
				| overlappingRange newX newY |
				overlappingRange := inventory removeAt: index.
				(range x < overlappingRange x) ifTrue: [ newX := range x ] ifFalse: [ newX := overlappingRange x ].
				(range y > overlappingRange y) ifTrue: [ newY := range y ] ifFalse: [ newY := overlappingRange y ].
				inventory add: (Point x: newX y: newY).
				]
			ifFalse: [
				unifiedInventory add: range.
				].
			
		inventory isEmpty not.
		] whileTrue.
	
	1 to: unifiedInventory size do: [ :index |
		| range |
		range := unifiedInventory at: index.
		count := count + range y - range x + 1.
		Transcript show: range asString, ' => ', count asString, ' points.'; cr.
		].
	
	^ count.! !

!DayFive2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 5/Dec/2025 23:30:01'!
countSpoiledIngredients

	| inventory count mode |
	inventory := OrderedCollection new.
	count := 0.
	mode := #INGREDIENT_ID_RANGES.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/5/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line |
			line := fileStream nextLine.
			(line size = 0)
				ifTrue: [ 
					mode := #AVAILABLE_INGREDIENT_IDS
					]
				ifFalse: [
					(mode = #INGREDIENT_ID_RANGES) ifTrue: [ | range |
						range := line findTokens: '-'.
						inventory add: (Point x: (range at: 1) asNumber y: (range at: 2) asNumber).
						].
					(mode = #AVAILABLE_INGREDIENT_IDS) ifTrue: [ | ingredient fresh index |
						ingredient := line asNumber.
						fresh := false.
						index := 0.
						[
							index := index + 1.
							(((inventory at: index) x to: (inventory at: index) y) includes: ingredient) ifTrue: [ fresh := true. ].
							(fresh not & (index < inventory size))
						] whileTrue.
						fresh ifTrue: [ count := count + 1 ].
						].
				].
			].
		].
	
	^ count.! !

!DaySix2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 12:01:16'!
doHomework

	| problems grandTotal |
	problems := nil.
	grandTotal := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/6/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line problemColumns |
			line := fileStream nextLine.
			problemColumns := line findTokens: ' '.
			(problems = nil) ifTrue: [
				problems := OrderedCollection new.
				(problemColumns size) timesRepeat: [ problems add: (Problem new) ].
				].
			1 to: problems size do: [ :index |
				| problem element |
				
				problem := problems at: index.
				element := problemColumns at: index.
				
				((element = '*') | (element = '+'))
					ifTrue: [
						problem setOperator: element.
						]
					ifFalse: [
						problem addNumber: element.
						].
				].
			].
		].
	
	problems do: [ :problem |
		grandTotal := grandTotal + problem calculateResult.
		].
		
	^ grandTotal.! !

!DaySix2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 13:16:12'!
doHomeworkRtl

	| problems problem lines grandTotal |
	problems := OrderedCollection new.
	problem := Problem new.
	lines := OrderedCollection new.
	grandTotal := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/6/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line |
			line := fileStream nextLine.
			lines add: line.
			].
		].
	
	(lines at: 1) size to: 1 by: -1 do: [ :column |
		| number |
		number := 0.
		1 to: lines size do: [ :row |
			| line char |
			line := lines at: row .
			char := line at: column .
			char isDigit
				ifTrue: [
					number := number * 10 + char digitValue .
					]
				ifFalse: [
					(char = Character space) ifFalse: [
						problem setOperator: char.
						].
					].
			].
			(number > 0)
				ifTrue: [
					problem addNumber: number.
					]
				ifFalse: [
					problems add: problem.
					problem := Problem new.
				].
		].
		problems add: problem.
	
	problems do: [ :p |
		"
		Transcript show: 'Problem: '.
		p numbers do: [ :n | Transcript show: n asString, ' '].
		Transcript show: p operator asString, ' = ', (p calculateResult) asString; cr.			
		"
		grandTotal := grandTotal + p calculateResult .
		] .
		
	^ grandTotal.! !

!Problem methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 13:03:35'!
addNumber: number

	number isString
		ifTrue: [
			numbers add: number asNumber.
			]
		ifFalse: [
			numbers add: number.
			] .
	^ self.! !

!Problem methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 13:13:50'!
calculateResult

	(operator = $*) ifTrue: [ result := 1 ] ifFalse: [ result := 0 ] .
	numbers do: operation .
	^ result .! !

!Problem methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 11:05:50'!
initialize

	numbers := OrderedCollection new.! !

!Problem methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 12:50:20'!
numbers

	^ numbers .! !

!Problem methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 12:55:46'!
operator

	^ operator .! !

!Problem methodsFor: 'as yet unclassified' stamp: 'J.K. 6/Dec/2025 13:13:09'!
setOperator: oper
	
	oper isString 
		ifTrue: [
			operator := oper at: 1.
			]
		ifFalse: [
			operator := oper
			].

	(operator = $*) ifTrue: [
		operation := [ :number | result := result * number  ].
		].
	(operator = $+) ifTrue: [
		operation := [ :number | result := result + number  ].
		].! !
