abstract class CallResult {

  onSuccess(Function(Map<String, dynamic>) action) {
    if (this is Success) {
      action.call((this as Success).data);
    }
  }

  onFailure(Function(Exception) action) {
    if (this is Failure) {
      action.call((this as Failure).exception);
    }
  }
}

class Success extends CallResult {
  late Map<String, dynamic> data;

  Success({required this.data});
}

class Failure extends CallResult {
  late Exception exception;

  Failure({required this.exception});
}