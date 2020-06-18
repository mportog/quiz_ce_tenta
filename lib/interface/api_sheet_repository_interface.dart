import 'package:ce_tenta_quizz/model/api_response.dart';
import 'package:ce_tenta_quizz/model/questions_response.dart';

abstract class IApiSheetnterface {
  Future<ApiResponse<QuizzQuestions>> fetchData();
}
