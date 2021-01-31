def find_anagrams(word, candidates):
    word = word.lower()
    sorted_word = sorted(word)
    anagrams = []
    for candidate in candidates:
        if len(word) == len(candidate): #O(1)
            if word != candidate.lower():
                if sorted_word == sorted(candidate.lower()):
                    anagrams.append(candidate)
    return anagrams
