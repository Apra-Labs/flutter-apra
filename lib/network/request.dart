class APIRequest {
  String path;
  Map<String, String> headers;
  Map<String, dynamic> body;

  APIRequest(this.path, this.headers, this.body) {
    this.headers ??= <String, String>{
      'Content-Type': 'application/json',
    };
  }
}
