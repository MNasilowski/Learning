class Garden:
    default_students = ['Alice', 'Bob', 'Charlie', 'David',
                'Eve', 'Fred', 'Ginny', 'Harriet',
                'Ileana', 'Joseph', 'Kincaid', 'Larry']
    translator = {'G': 'Grass','C': 'Clover',
                  'R': 'Radishes','V' : 'Violets'}

    def __init__(self, diagram, students = default_students):
        self.row = diagram.splitlines()
        self.students = sorted(students)
    
    def plants(self, student):
        student_id = self.students.index(student)
        sl_ob = slice(student_id*2,(student_id+1)*2)
        student_plants = self.row[0][sl_ob] + self.row[1][sl_ob]
        return  [self.translator[c] for c in student_plants]