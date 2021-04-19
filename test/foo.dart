import 'package:param/param.dart';

class Foo {
  final String value;

  Foo(this.value);

  Foo copyWith({Param<String>? value}) =>
      Foo(Param.apply(value, this.value));
}

class NullableFoo {
  final String? value;

  NullableFoo(this.value);

  NullableFoo copyWith({NullableParam<String?>? value}) =>
      NullableFoo(NullableParam.apply(value, this.value));
}
