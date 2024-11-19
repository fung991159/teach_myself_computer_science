# Construct a class hierarchy for people on a college campus. Include faculty, staff, and students. What do they have in common? What distinguishes them from one another?

# common: name, which faculty it belong to
# diff:
# faculty
# staff: salary, staff_grade
# student: enrolled_program, which


class Campus:
    def __init__(self, campus_name, campus_addr):
        self.campus_name = campus_name
        self.campus_addr = campus_addr


class Faculty(Campus):
    def __init__(self, campus_name, campus_addr, faculty_name):
        super().__init__(campus_name, campus_addr)
        self.faculty_name = faculty_name


class Staff(Faculty, Campus):
    def __init__(self, campus_name, campus_addr, faculty_name, name, salary, job_title):
        super().__init__(campus_name, campus_addr, faculty_name)

        self.name = name
        self.salary = salary
        self.job_title = job_title


class Student:
    def __init__(
        self, campus_name, campus_addr, faculty_name, name, age, enrolled_program
    ):
        super().__init__(campus_name, campus_addr, faculty_name)
        self.name = name
        self.age = age
        self.enrolled_program = enrolled_program
