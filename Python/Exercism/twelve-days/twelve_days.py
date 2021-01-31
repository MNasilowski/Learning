def recite(start_verse=1, end_verse=12):
    gifts = ["twelve Drummers Drumming", "eleven Pipers Piping",
             "ten Lords-a-Leaping", "nine Ladies Dancing",
             "eight Maids-a-Milking", "seven Swans-a-Swimming",
             "six Geese-a-Laying", "five Gold Rings",
             "four Calling Birds", "three French Hens",
             "two Turtle Doves","a Partridge in a Pear Tree"]
    days  = ["first", "second", "third", "fourth", "fifth",
             "sixth", "seventh", "eight", "ninth", "tenth",
             "eleventh", "twelfth"]
    for i in range(start_verse,end_verse+1):
        print(f"On the {days[i-1]} of Christmas my true love\
                        gave to me: {', '.join(gifts[12-i:])}")