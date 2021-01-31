def response(hey_bob):
    hey_bob = hey_bob.strip()
    if len(hey_bob) == 0:
        return "Fine. Be that way!"
    screeming = hey_bob == hey_bob.upper() and \
                hey_bob != hey_bob.lower()
    question = hey_bob[-1] == "?"
    if screeming and question:
        return "Calm down, I know what I'm doing!"
    elif not screeming and question:
        return "Sure."
    elif screeming and not question:
        return "Whoa, chill out!"
    else:
        return 'Whatever.'