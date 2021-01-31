import re

def abbreviate(words):
    words_list = re.findall("[a-zA-Z']*[a-zA-Z]",words)
    abb = ""
    for word in words_list:
        abb += word[0].upper()
    return abb