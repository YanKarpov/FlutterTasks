class ParentClass {
  String name;
  int _age; 
  String profession;

  ParentClass(this.name, this._age, this.profession);

  // Геттер для получения возраста
  int get age => _age;

  void introduce() {
    print("Меня зовут $name, мне $age лет. Я работаю $profession.");
    _secretMessage();
  }

  void celebrateBirthday() {
    if (_age >= 100) {
      print("$name уже достиг максимального возраста!");
      return;
    }
    _age++;
    print("С Днём рождения, $name! Теперь тебе $_age лет.");
  }

  // Приватный метод (не доступен за пределами класса)
  void _secretMessage() {
    print("Это секретное сообщение от $name.");
  }
}

class ChildClass extends ParentClass {
  String hobby;
  
  // Конструктор дочернего класса (возраст передаётся в родительский)
  ChildClass(String name, int age, this.hobby) : super(name, age, "студент ITHUB");

  // Переопределение метода introduce (подстройка под студента)
  @override
  void introduce() {
    print("Привет, я $name, и я студент ITHUB! Мне $age лет, и я увлекаюсь $hobby.");
  }

  static void showInfo(ChildClass student) {
    print("Ура, я стал на год старше! Теперь мне ${student.age} лет.");
  }
}

void main() {
  var parent = ParentClass("Антон", 40, "инженером");
  parent.introduce();
  parent.celebrateBirthday();

  var child = ChildClass("Ян", 20, "программированием");
  child.introduce();
  child.celebrateBirthday();

  ChildClass.showInfo(child);
}
