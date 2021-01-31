def is_pangram(sentence):
    chars = set()
    for char in sentence:
        if char.isalpha():
            chars.add(char.lower())
    return len(set(chars)) == 26
    
