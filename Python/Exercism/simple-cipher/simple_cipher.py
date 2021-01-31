class Cipher:
    def __init__(self, key='d'*100):
        self.chars = ord('z')-ord('a')+1
        self.key = key
        self.keyInt = key.encode('ascii')
        self.keyInt = [code - ord('a') for code in self.keyInt]
        
    def encode(self, text):
        text = [code - ord('a') for code in text.encode('ascii')]
        cipher = [(self.keyInt[i%len(self.keyInt)] + text[i])%self.chars
                  for i in range(len(text))]
        aaa = [chr(cipher[i]+ord('a')) for i in range(len(cipher))]
        return "".join(aaa)

    def decode(self, text):
        text = [code - ord('a') for code in text.encode('ascii')]
        cipher = [(-self.keyInt[i%len(self.keyInt)] + text[i])%self.chars
                  for i in range(len(text))]
        bbb = [chr(cipher[i]+ord('a')) for i in range(len(cipher))]
        return "".join(bbb)
