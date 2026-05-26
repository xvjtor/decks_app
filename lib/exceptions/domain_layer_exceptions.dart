class DomainLayerException {
  String cause;

  DomainLayerException(this.cause);

  @override
  String toString() {
    return cause;
  }
}
