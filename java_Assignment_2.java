class Student {
    String name;
    int age;
    char section;
    char gender;
    int subject1, subject2, subject3;

    Student(String name, int age, char section, char gender, int subject1, int subject2, int subject3) {
        this.name = name;
        this.age = age;
        this.section = section;
        this.gender = gender;
        this.subject1 = subject1;
        this.subject2 = subject2;
        this.subject3 = subject3;
    }

    int getTotalMarks() {
        return subject1 + subject2 + subject3;
    }

    double getPercentage() {
        return getTotalMarks() / 3.0;
    }

    void display() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Section: " + section);
        System.out.println("Gender: " + gender);
        System.out.println("Subject 1: " + subject1);
        System.out.println("Subject 2: " + subject2);
        System.out.println("Subject 3: " + subject3);
        System.out.println("Total Marks: " + getTotalMarks());
        System.out.println("Percentage: " + getPercentage() + "%");
    }
}

public class MainStudent {
    public static void main(String[] args) {

        Student s1 = new Student("s1", 20, 'A', 'M', 85, 90, 88);

        Student s2 = new Student("s2", 21, 'A', 'F', 0, 75, 80);

        Student s3 = new Student("s3", 22, 'B', 'M', 0, 60, 70);

        Student s4 = new Student("s4", 23, 'B', 'F', 92, 95, 89);

        s1.display();
        s2.display();
        s3.display();
        s4.display();
    }
}
