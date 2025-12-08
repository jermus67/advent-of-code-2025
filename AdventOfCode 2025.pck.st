'From Cuis7.5 [latest update: #7739] on 8 December 2025 at 11:10:34 pm'!
'Description '!
!provides: 'AdventOfCode 2025' 1 7!
SystemOrganization addCategory: #'AdventOfCode 2025'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 1'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 2'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 3'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 4'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 5'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 6'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 7'!
SystemOrganization addCategory: #'AdventOfCode 2025-Day 8'!


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

!classDefinition: #DaySeven2025 category: #'AdventOfCode 2025-Day 7'!
Object subclass: #DaySeven2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 7'!
!classDefinition: 'DaySeven2025 class' category: #'AdventOfCode 2025-Day 7'!
DaySeven2025 class
	instanceVariableNames: ''!

!classDefinition: #DayEight2025 category: #'AdventOfCode 2025-Day 8'!
Object subclass: #DayEight2025
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 8'!
!classDefinition: 'DayEight2025 class' category: #'AdventOfCode 2025-Day 8'!
DayEight2025 class
	instanceVariableNames: ''!

!classDefinition: #Point3D category: #'AdventOfCode 2025-Day 8'!
Object subclass: #Point3D
	instanceVariableNames: 'x y z'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AdventOfCode 2025-Day 8'!
!classDefinition: 'Point3D class' category: #'AdventOfCode 2025-Day 8'!
Point3D class
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

!DaySeven2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 7/Dec/2025 15:56:41'!
countBeamSplit

	| manifold beams splitCount |
	manifold := OrderedCollection new .
	splitCount := 0 .
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/7/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line  |
			line := fileStream nextLine .
			manifold add: line .
			] .
		] .

	beams := String new: ((manifold first) size) .

	beams at: ((manifold first) indexOf: $S) put: $|.
		
	manifold allButFirstDo: [ :manifoldLine |
		1 to: beams size do: [ :index |
			((beams at: index) = $|) ifTrue: [
				((manifoldLine at: index) = $^)
					ifTrue: [
						splitCount := splitCount + 1.
						manifoldLine at: (index - 1) put: $|.
						manifoldLine at: (index + 1) put: $|.
						beams at: (index - 1) put: $|.
						beams at: index put: (Character space).
						beams at: (index + 1) put: $|.
						]
					ifFalse: [
						manifoldLine at: index put: $|.
						]
				].
			].	
		].
		
	^ splitCount.! !

!DaySeven2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 7/Dec/2025 17:49:26'!
countTimeLines

	| manifold timeLines timeLinesCount |
	manifold := OrderedCollection new.
	timeLines := OrderedCollection new.
	timeLinesCount := 0.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/7/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line  |
			line := fileStream nextLine.
			manifold add: line.
			] .
		] .

	manifold first size timesRepeat: [ timeLines add: 0. ].

	timeLines at: ((manifold first) indexOf: $S) put: 1.
		
	manifold allButFirstDo: [ :manifoldLine |
		(manifoldLine indexOf: $^) > 0 ifTrue: [
			1 to: timeLines size do: [ :index |				
				(manifoldLine at: index) = $^ ifTrue: [
					| numberOfTimeLines timeLinesAtLeft timeLinesAtRight |

					numberOfTimeLines := timeLines at: index.
					timeLinesAtLeft := timeLines at: index - 1.
					timeLinesAtRight := timeLines at: index + 1.
					
					timeLines at: index - 1 put: numberOfTimeLines + timeLinesAtLeft.
					timeLines at: index put: 0.
					timeLines at: index + 1 put: numberOfTimeLines + timeLinesAtRight.				
					].
				].
			].
		].
	
	timeLines do: [ :count | timeLinesCount := timeLinesCount + count ].

	^ timeLinesCount.! !

!DayEight2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 23:05:38'!
findLargestCircuit

	| junctionBoxes shortestDistances sortedShortestDistancesKeys mostJunctionBoxes circuits result |
	junctionBoxes := OrderedCollection new.
	shortestDistances :=  Dictionary new.
	circuits := OrderedCollection new.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/8/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line elements new |
			line := fileStream nextLine.
			elements := line findTokens: ','.
			new := (Point3D new) x: (elements at: 1) asNumber y: (elements at:2) asNumber z: (elements at: 3) asNumber.
			junctionBoxes add: new.
			junctionBoxes allButLastDo: [ :old |
				| points |
				points := OrderedCollection new.
				points add: old.
				points add: new.
				shortestDistances at: (new distanceTo: old) put: points.
				].
			] .
		] .

	sortedShortestDistancesKeys := SortedCollection withAll: shortestDistances keys.
	
	1 to: 1000 do: [ : i | | key jbs j1 j2 mergeCircuitIndices |
		key := sortedShortestDistancesKeys at: i.
		jbs := shortestDistances at: key.
		j1 := jbs at: 1.
		j2 := jbs at: 2.
		mergeCircuitIndices := OrderedCollection new.
		1 to: circuits size do: [ :index |
			| circuit |
			circuit := circuits at: index.
			(self isCircuit: jbs partOf: circuit) ifTrue: [
				mergeCircuitIndices add: index.
				].
			].
		(mergeCircuitIndices size = 0)
			ifTrue: [
				| circuit |
				circuit := Set new.
				circuit add: j1.
				circuit add: j2.
				circuits add: circuit.
				]
			ifFalse: [
				| newCircuit oldCircuit |
				newCircuit := Set new.
				mergeCircuitIndices sort reversed do: [ :index |
					oldCircuit := circuits removeAt:  index.
					oldCircuit do: [ :element | newCircuit add: element ].
					].
				newCircuit add: j1.
				newCircuit add: j2.
				circuits add: newCircuit.
				].
		].
	
	mostJunctionBoxes := (circuits sort: [:a :b | a size < b size]) reversed.

	result := 1.
	1 to: 3 do: [ :index |
		result := result * (mostJunctionBoxes at: index) size.
		].
	
	^ result.! !

!DayEight2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 23:02:24'!
findSingleCircuit

	| junctionBoxes shortestDistances sortedShortestDistancesKeys circuits j1 j2 |
	junctionBoxes := OrderedCollection new.
	shortestDistances :=  Dictionary new.
	circuits := OrderedCollection new.
	
	'/home/jeroen/Documents/AdventOfCode/2025/day/8/input' asFileEntry readStreamDo: [:fileStream|
		[fileStream atEnd] whileFalse: [ | line elements new |
			line := fileStream nextLine.
			elements := line findTokens: ','.
			new := (Point3D new) x: (elements at: 1) asNumber y: (elements at:2) asNumber z: (elements at: 3) asNumber.
			junctionBoxes add: new.
			junctionBoxes allButLastDo: [ :old |
				| points |
				points := OrderedCollection new.
				points add: old.
				points add: new.
				shortestDistances at: (new distanceTo: old) put: points.
				].
			] .
		] .

	sortedShortestDistancesKeys := SortedCollection withAll: shortestDistances keys.
	
	[
		| key jbs mergeCircuitIndices |
		key := sortedShortestDistancesKeys removeAt: 1.
		jbs := shortestDistances at: key.
		j1 := jbs at: 1.
		j2 := jbs at: 2.
		junctionBoxes remove: j1 ifAbsent: [].
		junctionBoxes remove: j2 ifAbsent: [].
		mergeCircuitIndices := OrderedCollection new.
		1 to: circuits size do: [ :index |
			| circuit |
			circuit := circuits at: index.
			(self isCircuit: jbs partOf: circuit) ifTrue: [
				mergeCircuitIndices add: index.
				].
			].
		(mergeCircuitIndices size = 0)
			ifTrue: [
				| circuit |
				circuit := Set new.
				circuit add: j1.
				circuit add: j2.
				circuits add: circuit.
				]
			ifFalse: [
				| newCircuit oldCircuit |
				newCircuit := Set new.
				mergeCircuitIndices sort reversed do: [ :index |
					oldCircuit := circuits removeAt:  index.
					oldCircuit do: [ :element | newCircuit add: element ].
					].
				newCircuit add: j1.
				newCircuit add: j2.
				circuits add: newCircuit.
				].
			(sortedShortestDistancesKeys size > 0) & (junctionBoxes size > 0).
		] whileTrue.
	
	^ j1 x * j2 x.! !

!DayEight2025 class methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 07:46:18'!
isCircuit: circuit partOf: otherCircuit

	| partOf |
	
	partOf := false.
	
	circuit do: [ :junctionBox |
		partOf := partOf | (otherCircuit includes: junctionBox).
		].
	
	^ partOf.! !

!Point3D methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 06:44:57'!
= other
	
	| equal |
	
	equal := (self == other).
	
	equal ifFalse: [
		equal := (x = other x) & (y = other y) & (z = other z).
		].

	^ equal.! !

!Point3D methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 21:47:56'!
asString

	^ '(', x asString, ', ', y asString, ', ', z asString, ')'.! !

!Point3D methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 06:29:54'!
distanceTo: other

	| dx dy dz |
	 
	dx := other x - x.
    	dy := other y - y.
    	dz := other z - z.
	
	^ ((dx*dx) + (dy*dy) + (dz*dz)) asFloat sqrt.
! !

!Point3D methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 06:26:14'!
x

	^ x.! !

!Point3D methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 06:23:41'!
x: anX y: anY z: aZ

	x := anX.
	y := anY.
	z := aZ.! !

!Point3D methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 06:26:24'!
y

	^ y.! !

!Point3D methodsFor: 'as yet unclassified' stamp: 'J.K. 8/Dec/2025 06:26:33'!
z

	^ z.! !
