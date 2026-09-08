Class {
	#name : 'AoC2024Day09',
	#superclass : 'Object',
	#instVars : [
		'inputData',
		'storage',
		'currentSpace',
		'currentFile'
	],
	#classInstVars : [
		'currentSpace'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'parsing' }
AoC2024Day09 class >> demoData [
	^ '2333133121414131402'.

]

{ #category : 'as yet unclassified' }
AoC2024Day09 class >> on: input [
	| numbers |

	numbers := input asArray
    collect: [ :c | c asString asInteger ].

	^ self new
		inputData: numbers;
		yourself

]

{ #category : 'accessing' }
AoC2024Day09 >> checksum [
	| sum pos current |
	
	sum := 0.
	pos := 0.
	
	current := storage head.
	
	[ 
			| index size |
			index := current value index.
			size := current value size.
			"Transcript show: index; cr."
			
			index = #S ifFalse: [ 
					1 to: size do: [ :i |
							"Transcript show: ' - i: '; show: index; cr."
							sum := sum + (pos * index).
							pos := pos + 1.
					].
	  	].
			
			current := current next.		
			current isNotNil.
	] whileTrue.
			


	^ sum.
]

{ #category : 'accessing' }
AoC2024Day09 >> checksum2 [
	| sum pos current |
	
	sum := 0.
	pos := 0.
	
	current := storage head.
	
	[ 
			| index size |
			index := current value index.
			size := current value size.
			"Transcript show: index; cr."
			
			index = #S 
				ifFalse: [ 
					1 to: size do: [ :i |
							"Transcript show: ' - i: '; show: index; cr."
							sum := sum + (pos * index).
							pos := pos + 1.
					]
				]
				ifTrue: [ size ifNotNil: [ pos := pos + size ]].
			
			current := current next.		
			current isNotNil.
	] whileTrue.
			


	^ sum.
]

{ #category : 'parts' }
AoC2024Day09 >> generateStorage [
	| storage currentIndex |

	storage := AoCList new.
	currentIndex := 0.
	
	inputData doWithIndex: [ :value :i |
   | node val |

		(i \\ 2) = 1 
			ifTrue: [  
					val := AoC2024Day09Block initializeIndex: currentIndex size: value pos: i.
					currentIndex := currentIndex + 1.
				]
			ifFalse: [ 
					val := AoC2024Day09Block initializeIndex: #S size: value pos: i.
				].
			
			node := AoCNode value: val.
		 	storage pushBack: node.
		].
	
	^ storage.
]

{ #category : 'accessing' }
AoC2024Day09 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day09 >> inputData: data [
    inputData := data
]

{ #category : 'accessing' }
AoC2024Day09 >> moveOne [
	| toRemove newNode |
	
	currentSpace ifNil: [ ^ false ].
	currentFile ifNil: [ ^ false ].
	self spaceIsBeforeFile ifFalse: [ ^ false ].

	toRemove := self useSpace: currentSpace  for: currentFile.
	"Transcript show: 'To remove: '; show: toRemove; cr."
	
	currentFile value size: (currentFile value size - toRemove).
	currentFile value size <= 0 ifTrue: [
    | oldFile |
    oldFile := currentFile.
    currentFile := self previousFileBefore: currentFile.
    oldFile remove.
    currentFile ifNil: [ ^ false ].
	].
	
	^ true.
	
	

]

{ #category : 'accessing' }
AoC2024Day09 >> nextSpaceAfter: aNode [
   | node |

   node := aNode next.

   [ node notNil ] whileTrue: [
      node value index = #S ifTrue: [ ^ node ].
      node := node next
   ].

   ^ nil
]

{ #category : 'parts' }
AoC2024Day09 >> part1 [
	storage := self generateStorage.
	"storage printList."

	"Point to first space with some size."	
	currentSpace := storage head next.
	[currentSpace value size = 0] whileTrue: [ currentSpace := storage head next next ].
	Transcript show: 'currentSpace: '; show: currentSpace value index; show: ', size: '; show: currentSpace value size; cr.

	currentFile := storage tail.	
	[currentFile value index = #S] whileTrue: [ currentFile := currentFile previous ].
	Transcript show: 'currentFile: '; show: currentFile value index; show: ', size: '; show: currentFile value size; cr.
	
	[ self moveOne ] whileTrue.
	
	Transcript show: 'After:'; cr; cr.
	storage printList.
	
	^ self checksum.

]

{ #category : 'parts' }
AoC2024Day09 >> part2 [
	storage := self generateStorage.
	storage printList.

	currentFile := storage tail.	
	[currentFile value index = #S] whileTrue: [ currentFile := currentFile previous ].
	Transcript show: 'currentFile: '; show: currentFile value index; show: ', size: '; show: currentFile value size; cr.
	
	[
		"Transcript show: '-------------------------------------'; cr. "
		 "storage printList. "
		 self tryMoveComplete. 
	 ] whileTrue.
	
	Transcript show: 'After:'; cr; cr.
	storage printList.
	
	^ self checksum2.

]

{ #category : 'accessing' }
AoC2024Day09 >> previousFileBefore: aNode [
    | node |

    node := aNode previous.

    [ node notNil ] whileTrue: [
        node value index ~= #S ifTrue: [ ^ node ].
        node := node previous
    ].

    ^ nil
]

{ #category : 'accessing' }
AoC2024Day09 >> previousFileNotMovedBefore: aNode [
    | node |

    node := aNode previous.

    [ node notNil ] whileTrue: [
        ((node value index ~= #S) & (node value moved not)) ifTrue: [ ^ node ].
        node := node previous
    ].

    ^ nil
]

{ #category : 'running' }
AoC2024Day09 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 9 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]

{ #category : 'accessing' }
AoC2024Day09 >> spaceIsBeforeFile [
		 ^ (currentSpace value pos) <= (currentFile value pos).

]

{ #category : 'accessing' }
AoC2024Day09 >> tryMoveComplete [
	| currentFileSize space oldFile |

  currentFile ifNil: [ ^ false ].

	"Transcript show: 'Try move node: '; show: currentFile value index; show: ', size: '; show: currentFile value size; cr."
	currentFileSize := currentFile value size.

	space := self nextSpaceAfter: (storage head).
	[ (space value size) < currentFileSize ] whileTrue: [ 
			space := self nextSpaceAfter: space.
			space ifNil: [ 
			  currentFile := self previousFileNotMovedBefore: currentFile.
				^ true ]
	 ].

	(space value pos) >= (currentFile value pos) ifTrue: [ currentFile := self previousFileNotMovedBefore: currentFile.
				^ true ].

	self useSpace: space for: currentFile.

  oldFile := currentFile.
  currentFile := self previousFileNotMovedBefore: currentFile.
  oldFile value index: #S.
	
	^ true.

]

{ #category : 'accessing' }
AoC2024Day09 >> useSpace: space for: file [
	| toRemove newNode |
	
	toRemove := (space value size) min: (file value size).

	"Transcript show: 'Use space '; show: (space value) prettyStr; show: ' (pos: '; show: space value pos; show: ')'; cr."

	newNode := AoCNode value: (AoC2024Day09Block initializeIndex: (file value index) size: toRemove pos: (space value pos)).
	newNode value moved: true.
	
	space insertBefore: newNode.
	
	space value size: (space value size - toRemove).
	space value size <= 0 ifTrue: [
	    | oldSpace |
	    oldSpace := space.
	    currentSpace := self nextSpaceAfter: space.
	    oldSpace remove.
	].
	
	^ toRemove.	
	

]
