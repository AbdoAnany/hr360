abstract class Failure {
  final String? _message;
  const Failure(this._message, [List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String? _message;

  const ServerFailure(this._message) : super('');


  String? get message => _message;

  @override
  bool operator ==(Object other) =>
      other is ServerFailure && other._message == _message;

  @override
  int get hashCode => _message.hashCode;
}

class NoDataFailure extends Failure {
  NoDataFailure(super.message);

  @override
  bool operator ==(Object other) => other is NoDataFailure;

  @override
  int get hashCode => 0;
}

class CacheFailure extends Failure {
  CacheFailure(super.message);

  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => 0;
}
