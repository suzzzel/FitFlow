import 'package:fitflow/features/home/components/today_date_home_screen_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Translation date name to 3-symblos month length + int of day', () {
    // Arrange - подготовка входных данных для тестирования
    const String testTodayMonth = 'Jul';
    const String testTodayDate = '11';

    // Act  - само действие которые тестируется
    final res =
        translateDate(todayMonth: testTodayMonth, todayDate: testTodayDate);

    // Assert - проверка результатов тестирования с ожиданием
    expect(res, equals('Июл,11'));
  });

  test(
      'Translation date name to 3-symblos month length + int of day with incorrect day',
      () {
    // Arrange - подготовка входных данных для тестирования
    const String testTodayMonth = 'Abc';
    const String testTodayDate = '11';

    // Act  - само действие которые тестируется
    final res =
        translateDate(todayMonth: testTodayMonth, todayDate: testTodayDate);

    // Assert - проверка результатов тестирования с ожиданием
    expect(res, equals('11'));
  });
}
