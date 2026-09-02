"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAOC',
	#superclass : 'PackageManifest',
	#category : 'AOC-Manifest',
	#package : 'AOC',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAOC class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#AOC)) #'2026-09-02T21:40:49.728942+02:00') )
]

{ #category : 'code-critics' }
ManifestAOC class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#AOC)) #'2026-09-02T21:08:56.256703+02:00') )
]
