# mk-sambamba - module to mark duplicates with sambamba

## About mk-sambamba

**Objective**

Mark or remove duplicates using the sambamba program

## Module desription

This module uses the program sambamba to mark or remove duplicates from a bam file and produces a new bam file. Duplicates are considered as originated from the same DNA fragment. They may form due to: 

1. library preparation with PCR
2. if a single cluster is detected as multiple clusters by the sensor in the sequencer optical instrument, this is known as optic duplicates.

### Criteria to detect duplicates 
[SAMBAMBA]( https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4765878/) uses the same criteria as Piccard to detect duplicates.  It finds the 5' coordinates and mapping orientations of each read pair. When doing this it takes into account all clipping that has taking place as well as any gaps or jumps in the alignment. You can thus think of it as determining "if all the bases from the read were aligned, where would the 5' most base have been aligned". It then matches all read pairs that have identical 5' coordinates and orientations and marks as duplicates all but the "best" pair. "Best" is defined as the read pair having the highest sum of base qualities as bases with Q >= 15  
Information taken from [SEQANSWERS](http://seqanswers.com/forums/showthread.php?t=5424)

## Module configuration

### Data formats

* Input data
 
 Position sorted BAM file

* Output data

 BAM file with duplicates marked with the hexadecimal value 0x0400 (1024 in decimal) 

### Software dependencies

* [mk](https://9fans.github.io/plan9port/man/man1/mk.html "A successor for make.")
* [SAMBAMBA](http://lomereiter.github.io/sambamba/ "Sambamba: process your BAM data faster")

### Module parameters

Implemented sambamba code:

````
sambamba markdup \

$prereq \ -> Path to sorted BAM file
$target \ -> Path to marked outpu BAM file

````
## mk-sambamba directory structure
````
mk-sambamba/			##Module main directory
|-bin					##Executables directory
| |-create-targets		#bash with recipes
|-mkfile				##File in mk format, specifying the rules for building every result requested by bin/targets
|-Config-mk				##Configuration file this module
|-data-> test-data/		##Symbolic link to data for processing
|-test					#Directory for sample data
| |-test-data			#Subfirectory for sample data
|   |*_sort.bam			#sorted BAM files 
|.gitignore				#list of filess that should be ignored by the mk rule
|-README.md				##This document. General workflow description.

````

## References

\[1\][SAMBAMBA] ( https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4765878/)
\[2\] [SEQANSWERS] ( http://seqanswers.com/forums/showthread.php?t=5424/)


## Author Info

Developed by [Eugenia Zarza] (eugenia.zarza@gmail.com)








