Class {
	#name : 'AoC2024Day06',
	#superclass : 'Object',
	#instVars : [
		'inputData',
		'guard',
		'grid'
	],
	#category : 'AOC',
	#package : 'AOC'
}

{ #category : 'parsing' }
AoC2024Day06 class >> demoData [
	^ '....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...'.

]

{ #category : 'as yet unclassified' }
AoC2024Day06 class >> on: input [
	^ self new
		inputData: input lines asArray;
		yourself

]

{ #category : 'running' }
AoC2024Day06 >> doStep [

	| ca |

	ca := guard charAhead.

	"Transcript show: 'Char ahead: '; show: ca; cr."
	
	ca = $# 
		ifTrue: [ guard turnRight. ]
		ifFalse: [ 
			guard walk.
		].
	
	
]

{ #category : 'accessing' }
AoC2024Day06 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day06 >> inputData: data [
    inputData := data
]

{ #category : 'parts' }
AoC2024Day06 >> part1 [
	| |

	grid := AoC2024Day06Grid from: self inputData.
	guard := AoC2024Day06Guard on: grid.
	
	[ guard inside ] whileTrue: [ self doStep ].

	grid printGrid.

	Transcript show: (grid countX); cr.


]

{ #category : 'parts' }
AoC2024Day06 >> part2 [

]

{ #category : 'running' }
AoC2024Day06 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 6 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]
