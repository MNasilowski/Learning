import re

CODONS = {"AUG":"Methionine",
"UUU": "Phenylalanine", "UUC":"Phenylalanine",
"UUA":"Leucine", "UUG":"Leucine",
"UCU":"Serine","UCC":"Serine", "UCA":"Serine", "UCG":"Serine",
"UAU":"Tyrosine", "UAC":"Tyrosine",
"UGU":"Cysteine", "UGC":"Cysteine",
"UGG":"Tryptophan",
"UAA":"STOP","UAG":"STOP","UGA":"STOP"}
def proteins(strand):
    codons_list = re.findall('...',strand)
    protein_list = []
    for codon in codons_list:
        protein = CODONS.get(codon,"STOP")
        if protein != "STOP":
            protein_list.append(protein)
        else:
            return protein_list
    return protein_list
