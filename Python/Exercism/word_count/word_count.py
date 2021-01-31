def count_words(sentence):
    words_counter = {}
    sentence = sentence.lower()
    for char in sentence:
        if not char.isalnum() and char != "'":
            sentence = sentence.replace(char, " ")
    words = sentence.split()
    words = [word.strip("'") for word in words]
    for word in words:
        words_counter[word] = words.count(word)
    return words_counter
    