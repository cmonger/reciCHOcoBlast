#!/usr/bin/perl
use warnings ;

#Script for gathering the results of a reciprical blast 
#configured for CHO vs human>mouse>rat
#Requires input ids in sorted form. Pipeline in README.txt

#usage:
# reciblast.pl biomarthumanrefseqids biomarthumanrefseqpredictedids biomartmouserefseqids biomartmouserefseqpredictedids biomartratrefseqids biomartratrefseqpredictedids chovshuman humanvscho chovsmouse mousevscho chovsrat ratvscho > rbh.tsv
#e.g:
# perl ./reciblast.pl Human_Refseq_Ids.txt Human_Refseq_Predicted_Ids.txt Mouse_Refseq_Ids.txt Mouse_Refseq_Predicted_Ids.txt Rat_Refseq_Ids.txt Rat_Refseq_Predicted_Ids.txt trinityhuman_blast_95_ids.txt humantrinity_blast_95_ids.txt trinitymouse_blast_95_ids.txt mousetrinity_blast_95_ids.txt trinityrat_blast_95_ids.txt rattrinity_blast_95_ids.txt


#should probably change inputs to handle text file inputs rather than like 10 file handles

#reading input with #$ARGV[0]..[11]

##id input block
open fi, "<$ARGV[0]" or die;
@biomarthumanrefseqids = <fi>;
close fi;

open fi, "<$ARGV[1]" or die;
@biomarthumanrefseqpredictedids = <fi>;
close fi;

open fi, "<$ARGV[2]" or die;
@biomartmouserefseqids = <fi>;
close fi;

open fi, "<$ARGV[3]" or die;
@biomartmouserefseqpredictedids = <fi>;
close fi;

open fi, "<$ARGV[4]" or die;
@biomartratrefseqids = <fi>;
close fi;

open fi, "<$ARGV[5]" or die;
@biomartratrefseqpredictedids = <fi>;
close fi;


##Parsing ids
$humanids = () ;
$mouseids = () ;
$ratids = () ;


foreach (@biomarthumanrefseqids)
{
if ($_ = /^(\S+)\t(\S+)$/  )
	{
	$humanids->{$1}->{"genename"}= $2;
	}
}

foreach (@biomarthumanrefseqpredictedids)
{
if ($_ = /^(\S+)\t(\S+)$/  )
	{
	$humanids->{$1}->{"genename"}= $2;
	}
}

foreach (@biomartmouserefseqids)
{
if ($_ = /^(\S+)\t(\S+)$/  )
	{
	$mouseids->{$1}->{"genename"}= $2;
	}
}

foreach (@biomartmouserefseqpredictedids)
{
if ($_ = /^(\S+)\t(\S+)$/  )
	{
	$mouseids->{$1}->{"genename"}= $2;
	}
}
foreach (@biomartratrefseqids)
{
if ($_ = /^(\S+)\t(\S+)$/  )
	{
	$ratids->{$1}->{"genename"}= $2;
	}
}

foreach (@biomartratrefseqpredictedids)
{
if ($_ = /^(\S+)\t(\S+)$/  )
	{
	$ratids->{$1}->{"genename"}= $2;
	}
}

undef @biomarthumanrefseqids;
undef @biomarthumanrefseqpredictedids;
undef @biomartmouserefseqids;
undef @biomartmouserefseqpredictedids;
undef @biomartratrefseqids;
undef @biomartratrefseqpredictedids;


## blast results input block
open fi, "<$ARGV[6]" or die;
@chovshuman = <fi>;
close fi;

open fi, "<$ARGV[7]" or die;
@humanvscho = <fi>;
close fi;

open fi, "<$ARGV[8]" or die;
@chovsmouse = <fi>;
close fi;

open fi, "<$ARGV[9]" or die;
@mousevscho = <fi>;
close fi;

open fi, "<$ARGV[10]" or die;
@chovsrat = <fi>;
close fi;

open fi, "<$ARGV[11]" or die;
@ratvscho = <fi>;
close fi;

##Parsing ids, hits and scores

foreach (@chovshuman)
{
$line = $_ ;
if ($line = /^(\S+)\t(\S+)/)
	{
	
	@split = split /[\|.]/, $2 ; 
	if (exists $humanids->{$split[3]}->{"genename"} ) {print $1."\t".$split[3]."\t".$humanids->{$split[3]}->{"genename"}."\n"; }
	
	}	
}






