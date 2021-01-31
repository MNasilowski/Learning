import json
from difflib import get_close_matches

data = json.load(open("data.json"))

def translate(word):
    w = word.lower()
    if w in data:
        return data[w]
    elif w.lower() in data:
        return data[w.lower]
    elif w.capitalize() in data:
        return data[w.capitalize()]
    elif w.upper() in data:
        return data[w.upper()]
    elif len(get_close_matches(word,data.keys())) > 0:
        sugesstion = get_close_matches(word,data.keys())[0]
        yn = input(f"Did you meen {sugesstion} insted? pres Y or N.")
        if yn.lower() == 'y':
            return data[sugesstion]
        elif yn.lower() == 'n':
            return f"The \"{w}\" doesn't exist."
        else:
            return("We dont understand you")
    else:
        return f"The \"{w}\" doesn't exist."
word = input("say a word \n")


output = translate(word)
if type(output) == list:
    for i in output:
        print("*" +i)
else:
    print(output)
