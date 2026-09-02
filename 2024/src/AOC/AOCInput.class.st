Class {
	#name : 'AOCInput',
	#superclass : 'Object',
	#category : 'AOC-Utils',
	#package : 'AOC',
	#tag : 'Utils'
}

{ #category : 'as yet unclassified' }
AOCInput >> day: dayNumber [

    | filename |

    filename := 'day',
        (dayNumber printString padLeftTo: 2 with: $0),
        '.txt'.

    ^ ('/home/pugo/src/advent_of_code/2024/input' asFileReference / filename) contents
]
