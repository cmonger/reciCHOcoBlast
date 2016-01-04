# reciCHOcoBlast

##Requirements
1) Perl <br>
2) Blast+ cmd <br>
3) Biomart Refseq IDs for Human Mouse Rat (12/2015 Included in package) <br>
4) RefSeq Proteins as fasta and indexed blast databases for Human Mouse Rat <br>

##Usage
1) Blast search trinity assembly against each database with outfmt6 <br>
2) Extract subject and query above threshold (95%) with awk <br>
3) Use bbtools to extract subject transcripts from refeq files <br>
4) Create BLASTDB index of trinity assembly <br>
5) Blast back the transcripts <br>
6) Extract subject and query above threshold (95%) with awk <br>
7) Use reciCHOcoBlast.pl to find reciprocal hits <br>

E.G. <br>
perl ./reciblast.pl Human_Refseq_Ids.txt Human_Refseq_Predicted_Ids.txt Mouse_Refseq_Ids.txt Mouse_Refseq_Predicted_Ids.txt Rat_Refseq_Ids.txt Rat_Refseq_Predicted_Ids.txt trinityhuman_blast_95_ids.txt humantrinity_blast_95_ids.txt trinitymouse_blast_95_ids.txt mousetrinity_blast_95_ids.txt trinityrat_blast_95_ids.txt rattrinity_blast_95_ids.txt
