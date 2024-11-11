class PaginationClassType<T> {
  final T Function() createT;

  PaginationClassType(this.createT);

  T callCConstructor() {
    T t = createT();
    return t;
  }
}