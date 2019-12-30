class Token:
    def __init__(self, type_, value=None):
        self.type = type_
        self.value = value

    def __repr__(self):
        if self.value: return self.type+":"+str(self.value)
        return self.type

print(Token("INT", "0"))
