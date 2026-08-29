Class {
	#name : 'AOCInput',
	#superclass : 'Object',
	#category : 'AOC',
	#package : 'AOC'
}

{ #category : 'as yet unclassified' }
AOCInput >> day: dayNumber [

    | filename |

    filename := 'day',
        (dayNumber printString padLeftTo: 2 with: $0),
        '.txt'.

    ^ ('/home/pugo/src/advent_of_code/2024/input' asFileReference / filename) contents
]
