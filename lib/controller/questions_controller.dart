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
  Future<dynamic> fetchQuestions() async {
    try {
      isLoading = true;
      var response = await _apiSheetRepository.fetchData();
      if (response.status == 200) {
        var iterator = response.data.questions;
        questions.clear();
        questions.addAll(ObservableList<Questions>.of(iterator));
        // for (Questions q in iterator) questions.add(q);//só add cada vez mais
        // questions = ObservableList<Questions>.of(iterator);//só add cada vez mais
        // questions = iterator;//só add cada vez mais
        // questions = ObservableList.of(iterator); //só add cada vez mais
        return questions[questionNumber];
      } else {
        message = response.message;
        print(response.message);
        return message;
      }
    } catch (e) {
      print('Error Fetching Data on QuestionsController: ${e.toString()}');
      message = e.toString();
      print(e);
      return message;
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
