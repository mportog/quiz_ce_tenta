import 'package:ce_tenta_quizz/model/questions_response.dart';
import 'package:ce_tenta_quizz/repositoriy/api_sheet_repository.dart';
import 'package:mobx/mobx.dart';
part 'questions_controller.g.dart';

class QuestionsStore = _QuestionsStoreBase with _$QuestionsStore;

abstract class _QuestionsStoreBase with Store {
  ApiSheetRepository _apiSheetRepository;

  _QuestionsStoreBase() {
    _apiSheetRepository = ApiSheetRepository();
  }
  @observable
  bool isLoading = false;

  @observable
  String message = '';

  @observable
  ObservableList<Questions> questions = ObservableList<Questions>();

  @observable
  int questionNumber = 0;

  @action
  void setCurrentQuestion(int value) => questionNumber = value;

  @action
  void fetchQuestions() async {
    try {
      isLoading = true;
      var response = await _apiSheetRepository.fetchData();
      if (response.status == 200) {
        questions = ObservableList<Questions>.of(response.data.questions);
      } else {
        message = response.message;
        print(response.message);
      }
    } catch (e) {
      print('Error Fetching Data on QuestionsController: ${e.toString()}');
    } finally {
      isLoading = false;
    }
  }

  @action
  void stopLoading() {
    print('antes: $isLoading');
    isLoading = !isLoading;
    print('depois: $isLoading');
  }
}
