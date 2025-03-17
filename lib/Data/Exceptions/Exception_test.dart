class ExceptionTest implements Exception {
  final _message;
  final _prifix;
  ExceptionTest([this._message, this._prifix]);
  @override
  String toString() {
    return '$_message$_prifix';
  }
}

class noInternetException extends ExceptionTest {
  noInternetException([String? _message])
    : super(_message, 'No internet connection');
}
class unAuthorizedException extends ExceptionTest {
  unAuthorizedException([String? _message])
    : super(_message, 'You dont have access for this');
}
class requestTimeout extends ExceptionTest {
  requestTimeout([String? _message])
    : super(_message, 'Request Time Out');
}
class fetchDataExeption extends ExceptionTest {
  fetchDataExeption([String? _message])
    : super(_message, '');
}

