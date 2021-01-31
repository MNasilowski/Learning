import re
class PhoneNumber:
    def __init__(self, number):
        phone = [int(i) for i in re.findall(r"[0-9]",number)]
        if len(phone) < 10:
            raise ValueError("number to short")
        elif len(phone) > 10 and phone[0] != 1:
            raise ValueError("number to long")
        elif len(phone) == 11:
                phone = phone[1:]
        if len(phone) == 10:
            if phone[0] < 2 or phone[3] < 2:
                raise ValueError("value error")
            else:
                self.number = ''.join(map(str,phone))
        
            
                    
            