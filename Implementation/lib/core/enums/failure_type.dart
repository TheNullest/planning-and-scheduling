enum FailureType {
  local,
  remote,
  authentication,
  unexpected;

  @override
  String toString() {
    switch (this) {
      case FailureType.local:
        return 'local';
      case FailureType.remote:
        return 'remote';
      case FailureType.authentication:
        return 'authentication';
      case FailureType.unexpected:
        return 'unexpected';
    }
  }
}
