import 'package:ce_tenta_quizz/interface/api_sheet_repository_interface.dart';
import 'package:ce_tenta_quizz/model/api_response.dart';
import 'package:ce_tenta_quizz/model/questions_response.dart';
import 'package:ce_tenta_quizz/shared/api_constants.dart';
import 'package:dio/dio.dart';

class ApiSheetRepository implements IApiSheetnterface {
  Dio dio = Dio();
  bool isLoading;

  @override
  Future<ApiResponse<QuizzQuestions>> fetchData() async {
    try {
      isLoading = true;
      Response response = await dio.get(Api.apiUrl);
      var responseData = QuizzQuestions.fromJson(response.data);
      isLoading = false;
      return ApiResponse(
          message: response.statusMessage,
          status: response.statusCode,
          data: responseData);
    } catch (e) {
      isLoading = false;
      return ApiResponse(message: e, status: 500);
    }
  }
}
