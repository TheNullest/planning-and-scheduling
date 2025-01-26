import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/network/connection_checker.dart';

class MockConnectionChecker extends Mock implements ConnectionChecker {}

void main() {
  late MockConnectionChecker mockConnectionChecker;

  setUp(() {
    mockConnectionChecker = MockConnectionChecker();
  });

  test('should return true when connected', () {
    when(() => mockConnectionChecker.isConnected).thenAnswer((_) async => true);

    expect(mockConnectionChecker.isConnected, completion(isTrue));
  });

  test('should return false when not connected', () {
    when(() => mockConnectionChecker.isConnected)
        .thenAnswer((_) async => false);

    expect(mockConnectionChecker.isConnected, completion(isFalse));
  });
}
