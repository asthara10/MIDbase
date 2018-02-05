INSERT INTO Microindel (ID_Microindel, Name)
VALUES (1, DUP22Q11.2);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (2, DUPXP11.22);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (3, DUP3Q29);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (4, CXDUPQ26.3);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (5, DEL15Q13.3);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (6, DELXQ28);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (7, DEL3Q29);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (8, DEL17Q21.31);
INSERT INTO Microindel (ID_Microindel, Name, Info)
VALUES (9, LOC106736481, This region is known to undergo non-allelic homologous recombination (NAHR) with a similar low-copy repeat region, the 15q13 proximal microdeletion breakpoint recombination region, which is located nearly 2 Mb centromere-proximal to this region, in direct orientation. NAHR between these recombination regions can lead to deletions of the intervening sequence, and has been associated with intellectual disabilities and/or developmental delays. While deletions of the intervening sequences has been observed in many affected individuals, finer mapping of the recombination regions has been limited to a small number of individuals. This recombination region partially overlaps that of a golgin A8 family member (GOLGA8 family), and the palindromic nature of the genes within this gene family has been implicated in the recombination events. [provided by RefSeq, Oct 2016]);
INSERT INTO Microindel (ID_Microindel, Name, Info)
VALUES (10, LOC106736480, This region is known to undergo non-allelic homologous recombination (NAHR) with a similar low-copy repeat region, the 15q13 distal microdeletion recombination region, which is located nearly 2 Mb centromere-distal to this region, in direct orientation. NAHR between these recombination regions can lead to deletions of the intervening sequence, and may be associated with autism. While deletions of the intervening sequences has been observed in many affected individuals, finer mapping of the recombination regions has been limited to a small number of individuals. This recombination region partially overlaps that of a golgin A8 family member (GOLGA8 family), and the palindromic nature of the genes within this gene family has been implicated in the recombination events. [provided by RefSeq, Oct 2016]);
INSERT INTO Microindel (ID_Microindel, Name)
VALUES (11, DEL17Q11.2);
INSERT INTO Location (ID_Location, Start, End, Strand)
VALUES (1, 17,400,000, 25,500,000, 22q11.2);
INSERT INTO Location (ID_Location, Start, End, Strand)
VALUES (2, 50,100,000, 54,800,000, Xp11.22);
INSERT INTO Location (ID_Location, Start, End, Strand)
VALUES (3, 192,600,000, 198,295,559, 3q29);
INSERT INTO Location (ID_Location, Start, End, Strand)
VALUES (4, 134,500,000, 138,900,000, Xq26.3);
INSERT INTO Location (ID_Location, Start, End, Strand)
VALUES (5, 30,900,000, 33,400,000, 15q13.3);
INSERT INTO Location (ID_Location, CytonLoc, ID_Microindel)
VALUES (6, Xq28, 6);
INSERT INTO Location (ID_Location, Start, End, Strand)
VALUES (7, 192,600,000, 198,295,559, 3q29);
INSERT INTO Location (ID_Location, CytonLoc, ID_Microindel)
VALUES (8, 17q21.31, 8);
INSERT INTO Location (ID_Location, CytonLoc, ID_Microindel)
VALUES (9, 15q13.3, 9);
INSERT INTO Location (ID_Location, CytonLoc, ID_Microindel)
VALUES (10, 15q13.2, 10);
INSERT INTO Location (ID_Location, Start, End, Strand)
VALUES (11, 27,400,000, 33,500,000, 17q11.2);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (1, 1);
INSERT INTO Gene (ID_Gene, GeneName, ID_Location)
VALUES (2, MRX17, 2);
INSERT INTO Gene (ID_Gene, GeneName, ID_Location)
VALUES (3, MRX31, 2);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (4, 3);
INSERT INTO Gene (ID_Gene, GeneName, ID_Location)
VALUES (5, XLAG, 4);
INSERT INTO Gene (ID_Gene, GeneName, ID_Location)
VALUES (6, EIG7, 5);
INSERT INTO Gene (ID_Gene, GeneName, ID_Location)
VALUES (7, SCZD13, 5);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (8, 6);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (9, 7);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (10, 8);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (11, 9);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (12, 10);
INSERT INTO Gene (ID_Gene, ID_Location)
VALUES (13, 11);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (1);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (2);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (3);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (4);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (5);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (6);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (7);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (8);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (9);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (10);
INSERT INTO ClinicalSignificance (ID_ClinSig)
VALUES (11);
INSERT INTO Disease (ID_Disease, ID_MIM)
VALUES (1, 608363);
INSERT INTO Disease (ID_Disease, ID_MIM)
VALUES (2, 300705);
INSERT INTO Disease (ID_Disease, ID_MIM)
VALUES (3, 611936);
INSERT INTO Disease (ID_Disease, ID_MIM)
VALUES (4, 300942);
INSERT INTO Disease (ID_Disease, ID_MIM)
VALUES (5, 612001);
INSERT INTO Disease (ID_Disease, DiseaseName, ID_MIM)
VALUES (6, Deafness, 300475);
INSERT INTO Disease (ID_Disease, DiseaseName, ID_MIM)
VALUES (7, Dystonia, 300475);
INSERT INTO Disease (ID_Disease, DiseaseName, ID_MIM)
VALUES (8, cerebral_hypomethylation, 300475);
INSERT INTO Disease (ID_Disease, DiseaseName, ID_MIM)
VALUES (9, DDCH, 300475);
INSERT INTO Disease (ID_Disease, ID_MIM)
VALUES (10, 609425);
INSERT INTO Disease (ID_Disease, DiseaseName, ID_MIM)
VALUES (11, Koolen-de_Vries_syndrome(KDVS), 610443);
INSERT INTO Disease (ID_Disease)
VALUES (12);
INSERT INTO Disease (ID_Disease)
VALUES (13);
INSERT INTO Disease (ID_Disease, DiseaseName, ID_MIM)
VALUES (14, neurofibromatosis1(NF1), 613675);
INSERT INTO References (ID_Ref, PMID, Database)
VALUES (1, 23521024, NCBI);
INSERT INTO References (ID_Ref, PMID, Database)
VALUES (2, 22876571, NCBI);
INSERT INTO References (ID_Ref, Database)
VALUES (3, NCBI);
INSERT INTO References (ID_Ref, Database)
VALUES (4, NCBI);
INSERT INTO References (ID_Ref, PMID, Database)
VALUES (5, 25470569, NCBI);
INSERT INTO References (ID_Ref, PMID, Database)
VALUES (6, 24246141, NCBI);
INSERT INTO References (ID_Ref, Database)
VALUES (7, NCBI);
INSERT INTO References (ID_Ref, Database)
VALUES (8, NCBI);
INSERT INTO References (ID_Ref, Database)
VALUES (9, NCBI);
INSERT INTO References (ID_Ref, PMID, Database)
VALUES (10, 25326701, NCBI);
INSERT INTO References (ID_Ref, PMID, Database)
VALUES (11, 25326701, NCBI);
INSERT INTO References (ID_Ref, Database)
VALUES (12, NCBI);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (1, 1);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (1, 2);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (2, 3);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (3, 4);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (4, 5);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (5, 6);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (6, 7);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (7, 8);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (8, 9);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (9, 10);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (10, 11);
INSERT INTO Microindel_has_References (ID_Microindel, ID_Ref)
VALUES (11, 12);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (1, 1);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (2, 2);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (3, 3);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (4, 4);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (5, 5);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (6, 6);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (7, 7);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (8, 8);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (9, 9);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (10, 10);
INSERT INTO Microindel_has_ClinicalSignificance (ID_Microindel, ID_ClinSig)
VALUES (11, 11);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (1, 1);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (2, 2);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (3, 3);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (4, 4);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (5, 5);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (6, 6);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (6, 7);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (6, 8);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (6, 9);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (7, 10);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (8, 11);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (9, 12);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (10, 13);
INSERT INTO Microindel_has_Disease (ID_Microindel, ID_Disease)
VALUES (11, 14);
