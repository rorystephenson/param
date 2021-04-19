class NullableParam<T> {
  final T? value;

  NullableParam.set(this.value);

  NullableParam.nullify() : value = null;

  static T? apply<T>(NullableParam<T?>? param, T? existing) {
    if (param != null) return param.value;
    return existing;
  }
}

class Param<T extends Object> extends NullableParam<T> {
  @override
  T value;

  Param.set(this.value) : super.set(value);

  static T apply<T extends Object>(Param<T>? param, T existing) {
    if (param != null) return param.value;
    return existing;
  }
}
