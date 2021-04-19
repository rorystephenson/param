import 'package:param/src/param.dart';
import 'package:test/test.dart';

import 'foo.dart';

void main() {
  group(Param, () {
    test('value can be changed', () {
      expect(
        Foo('original').copyWith(value: Param.set('changed')).value,
        equals('changed'),
      );
    });

    test('value can be left as is', () {
      expect(
        Foo('original').copyWith().value,
        equals('original'),
      );
    });
  });

  group(NullableParam, () {
    test('value can be changed from null to something', () {
      expect(
        NullableFoo(null).copyWith(value: Param.set('changed')).value,
        equals('changed'),
      );
    });

    test('value can be changed from something to something else', () {
      expect(
        NullableFoo('original').copyWith(value: Param.set('changed')).value,
        equals('changed'),
      );
    });

    test('value can be left as null', () {
      expect(
        NullableFoo(null).copyWith().value,
        isNull,
      );
    });

    test('value can be left as something', () {
      expect(
        NullableFoo('original').copyWith().value,
        equals('original'),
      );
    });

    test('value can remain null after being nullified', () {
      expect(
        NullableFoo(null).copyWith(value: NullableParam.nullify()).value,
        isNull,
      );
    });

    test('value can be set from something to null', () {
      expect(
        NullableFoo('original').copyWith(value: NullableParam.nullify()).value,
        isNull,
      );
    });
  });
}
