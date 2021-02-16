class APIResponse<T> {
  T data;
  int code;
  String message;

  APIResponse({this.code, this.message, this.data});
}
