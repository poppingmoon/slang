import 'package:fast_i18n/src/decoder/csv_decoder.dart';
import 'package:test/test.dart';

void main() {
  group('decode', () {
    test('wrong order should throw exception', () {
      expect(
        () => CsvDecoder().decode(
          [
            'key,en,de',
            'onboarding.pages.1.title,Second Page,Zweite Seite',
            'onboarding.pages.0.title,First Page,Erste Seite',
            'onboarding.pages.0.content,First Page Content,Erster Seiteninhalt',
          ].join('\r\n'),
        ),
        throwsA(
            'The leaf "onboarding.pages.1.title" cannot be added because there are missing indices.'),
      );
    });
  });
}
