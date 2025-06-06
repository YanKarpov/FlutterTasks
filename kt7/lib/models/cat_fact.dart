// Модель одного факта о коте
class CatFact {
  final String fact;   // Сам факт
  final int length;    // Длина текста факта

  CatFact({required this.fact, required this.length});

  // Создание объекта из JSON
  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      fact: json['fact'],
      length: json['length'],
    );
  }
}
