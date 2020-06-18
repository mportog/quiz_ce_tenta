class ApiResponse<T> {
  final int status;
  T data;
  final String message;

  ApiResponse({this.status, this.data, this.message});
}
