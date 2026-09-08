Class {
	#name : 'AoC2024Day08',
	#superclass : 'Object',
	#instVars : [
		'inputData',
		'guard',
		'grid'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'parsing' }
AoC2024Day08 class >> demoData [
	^ '............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............'.

]

{ #category : 'as yet unclassified' }
AoC2024Day08 class >> on: input [
	^ self new
		inputData: input lines asArray;
		yourself

]

{ #category : 'parts' }
AoC2024Day08 >> findAntennas [

	| antennas |
	
	antennas := Dictionary new.

	1 to: grid height do: [ :y |
		1 to: grid width do: [ :x |
			| c |
			  c := grid charAtPos: x@y.
			  c ~= $. ifTrue: [ 
					  	antennas at: c ifAbsentPut: [ OrderedCollection new ].
							(antennas at: c) add: x@y.
					 ].
					]
			].

	^ antennas.	
]

{ #category : 'accessing' }
AoC2024Day08 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day08 >> inputData: data [
    inputData := data
]

{ #category : 'parts' }
AoC2024Day08 >> part1 [
	| antennas |

	grid := AoCGrid from: self inputData.

	antennas := self findAntennas.
	
	antennas do: [ :antenna |
			self plotAntinodes: antenna continuous: false.
		].

	^ grid countChar: $#.

]

{ #category : 'parts' }
AoC2024Day08 >> part2 [
	| antennas |

	grid := AoCGrid from: self inputData.

	antennas := self findAntennas.
	
	antennas do: [ :antenna |
			self plotAntinodes: antenna continuous: true.
		].

	grid printGrid.

	^ grid countChar: $#.


]

{ #category : 'parts' }
AoC2024Day08 >> plotAntinode: a to: b continuous: continuous [
	| diff d |

	"Transcript show: a; show: ' -> '; show: b; cr."

	diff := b - a.
  d := b + diff.

	grid charAtPos: a set: $#. 

	continuous 
		ifTrue: [ 
			[grid posIsInside: d] whileTrue: [ 
					grid charAtPos: d set: $#. 
				  d := d + diff.
				]
			]

		ifFalse: [ 
			(grid posIsInside: d) ifTrue: [ 
						grid charAtPos: d set: $#. 
				 ]
			]
 
]

{ #category : 'parts' }
AoC2024Day08 >> plotAntinodes: antenna continuous: continuous [
	||

	1 to: antenna size do: [ :i |
		1 to: antenna size do: [ :j |
			i ~= j ifTrue: [ 
					"Transcript show: i; show: ', '; show: j; cr. "
					self plotAntinode: (antenna at: i) to: (antenna at: j) continuous: continuous.	
				].
			].
		 ].
]

{ #category : 'running' }
AoC2024Day08 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 8 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]
