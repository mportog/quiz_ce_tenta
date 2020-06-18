import 'package:ce_tenta_quizz/shared/enum/enum_status.dart';

class ApiResponse<T> {
  Status status;

  T data;

  String message;
}
