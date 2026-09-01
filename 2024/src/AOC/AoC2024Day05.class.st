Class {
	#name : 'AoC2024Day05',
	#superclass : 'Object',
	#instVars : [
		'inputData'
	],
	#category : 'AOC',
	#package : 'AOC'
}

{ #category : 'parsing' }
AoC2024Day05 class >> demoData [
	^ '47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47'.

]

{ #category : 'as yet unclassified' }
AoC2024Day05 class >> on: input [
	^ self new
		inputData: input lines;
		yourself

]

{ #category : 'accessing' }
AoC2024Day05 >> correctUpdate: update from: rules [
	"Correct an update by applying rules."

	rules do: [ :rule |
		| r1 r2 i1 i2 |
		r1 := rule first.
		r2 := rule second.
		i1 := update indexOf: r1.
		i2 := update indexOf: r2.
		
		((i1 > 0) & (i2 > 0)) ifTrue: [ 
			i1 > i2 ifTrue: [ 
				update removeAt: i2.
				update add: r2 beforeIndex: i1.
			].	
		].
	].

	^ update.
	
]

{ #category : 'accessing' }
AoC2024Day05 >> genUpdateDict: update [
	"Create a Dict with each update number pointing to an
	 a set of all the numbers before the update number."
	| updateDict len |
	
	updateDict := Dictionary new.
	len := update size.
	
	1 to: len do: [ :i | 
		| before |
		before := (update copyFrom: 1 to: i-1) asSet.
		updateDict at: (update at: i) put: before.
	].
	
	^ updateDict.
]

{ #category : 'accessing' }
AoC2024Day05 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day05 >> inputData: data [
    inputData := data
]

{ #category : 'parts' }
AoC2024Day05 >> parsePageOrdering [
	| separator rules |

	
	separator := self inputData indexOf: ''.
	
	rules := self inputData copyFrom: 1 to: separator - 1.

   ^ rules collect: [ :rule |
	    (rule splitOn: '|')
	        collect: [ :number | number asInteger ]
	].
	

]

{ #category : 'parts' }
AoC2024Day05 >> parseUpdates [
	| separator updates |

	separator := self inputData indexOf: ''.
	
	updates := self inputData copyFrom: separator + 1 to: self inputData size.

   ^ updates collect: [ :update |
	    (update splitOn: ',')
	        collect: [ :number | number asInteger ]
	].

]

{ #category : 'parts' }
AoC2024Day05 >> part1 [
	| rules updates sum |

	rules := self parsePageOrdering.
	updates := self parseUpdates.

   sum := 0.
	updates do: [ :update | 
		(self validateUpdate: update on: rules) ifTrue: [ 
			sum := sum + (update at: (1 + (update size // 2))) asInteger.
			 ].
		].

	^ sum
]

{ #category : 'parts' }
AoC2024Day05 >> part2 [
	| rules updates sum |

	rules := self parsePageOrdering.
	updates := self parseUpdates.

   sum := 0.
	updates do: [ :update | 
		(self validateUpdate: update on: rules) ifFalse: [ 
			| correctedUpdate |
			correctedUpdate := self correctUpdate: update from: rules.

			[self validateUpdate: correctedUpdate on: rules] whileFalse: [ 
				correctedUpdate := self correctUpdate: correctedUpdate from: rules.
			].
			
			sum := sum + (correctedUpdate at: (1 + (correctedUpdate size // 2))) asInteger.
		].
	].

	^ sum
]

{ #category : 'running' }
AoC2024Day05 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 5 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]

{ #category : 'accessing' }
AoC2024Day05 >> validateUpdate: update on: rules [
	| updateDict |
	
	updateDict := self genUpdateDict: update.
		
	rules do: [ :rule |
		| r1 |
		r1 := rule first.
		(updateDict includesKey: r1) ifTrue: [
			((updateDict at: r1) includes: rule second) ifTrue: [ ^ false ].
		 ].
	].

	^ true.
	
]
