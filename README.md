## Simplifies changing/nullifying parameters for copyWith methods

### Examples

#### Non-nullable parameter

```dart
import 'package:param/param.dart';

class Foo {
  final String value;

  Foo(this.value);

  Foo copyWith({Param<String>? value}) =>
      Foo(Param.apply(value, this.value));
}
```

You can:

 * Leave the value as-is by omitting the param (or passing `null`, it is the same).
 * Change the value with a param value of `Param.set('new value')`

#### Nullable parameter

```dart
class NullableFoo {
  final String? value;

  NullableFoo(this.value);

  NullableFoo copyWith({NullableParam<String?>? value}) =>
      NullableFoo(NullableParam.apply(value, this.value));
}
```

`NullableParam` is more flexible, you can:

 * Leave the value as-is by omitting the nullable param (or passing `null`, it is the same)
 * Change the value with a nullable param value of `NullableParam.set('new value')`
 * Set the value to `null` with a nullable param value of `NullableParam.nullify()`
