import 'package:dio/dio.dart';
import '../models/cat_fact.dart';

// Сервис для получения фактов о котах через Dio
class CatFactService {
  final Dio _dio = Dio(); // HTTP-клиент

  // Получение одного факта о коте
  Future<CatFact> fetchCatFact() async {
    try {
      final response = await _dio.get(
        'https://catfact.ninja/fact',
        options: Options(
          headers: {'Accept': 'application/json'}, // Запрос JSON
          validateStatus: (status) => status != null && status < 500, // Обрабатываем ошибки вручную
        ),
      );

      if (response.statusCode == 200) {
        return CatFact.fromJson(response.data); // Парсим в модель
      } else {
        throw Exception('Ошибка сервера: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Обработка ошибок Dio
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Таймаут соединения');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Неверный ответ от сервера');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      // Обработка других ошибок
      throw Exception('Неизвестная ошибка: $e');
    }
  }
}
