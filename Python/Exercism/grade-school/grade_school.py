class School:
    def __init__(self):
        self.student_list = dict()
        self.roster_list = []

    def add_student(self, name, grade):
        try:
            self.student_list[grade].append(name)
            self.student_list[grade].sort()
        except:
            self.student_list[grade] = [name]
        finally:
            self.roster_list = []
            for i in sorted(list(self.student_list.keys())):
                self.roster_list.extend(self.student_list[i])

    def roster(self):
        return(self.roster_list)

    def grade(self, grade_number):
        try:
            return(self.student_list[int(grade_number)])
        except:
            return([])
