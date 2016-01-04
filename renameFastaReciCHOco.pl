#!/usr/bin/perl
#script for pulling out fasta reads by reciprical blast ids and renaming
#only working on the cds file of cdhit because bbtools cannot handle '*' in the .pep file


#filterbyname.sh in=../combined_clusters.est.transdecoder.cds include=t names=reciIds.txt out=filteredreci.fa
#cut -d " " -f 1 filteredreci.fa > trimmedheadersfilteredreci.fa

#USAGE
#./renameFastaReciCHOco.pl originalfastafile recihitids.tsv > renamedrecipricalhits.fa
#e.g. ./renameFastaReciCHOco.pl trimmedheadersfilteredreci.fa recihitids.tsv > renamedrecipricalhits.fa

#Can run EMBOSS tools to translate sequence after this
#transeq -sequence renamedrecipricalhits.fa -outseq reciprocaltranslate.fa


open fi, "<$ARGV[0]" or die;
@fastafile = <fi>;
close fi;

open fi, "<$ARGV[1]" or die;
@idfile = <fi>;
close fi;

#Parsing output of reciCHOcoblast

my $ids; 

foreach (@idfile)
	{
	if ($_ = /^(\S+)\t(\S+)\t(\S+)/)
		{
		$ids->{$1}->{"genename"} = $2 ;
		$ids->{$1}->{"organism"} = $3 ;
		}
	}


#Parsing and printing fastafile

foreach (@fastafile)
	{
	if (/^>(\S+)/)
		{
		print ">".$ids->{$1}->{"genename"}."\t Cricetulus griseus PREDICTED: Reciprocal Blast Refseq ".$ids->{$1}->{"organism"}."\n";
		}
	else 
		{
		print "$_" ;
		}
	}
