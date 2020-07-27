import 'package:ce_tenta_quizz/model/questions_response.dart';
import 'package:ce_tenta_quizz/repositoriy/api_sheet_repository.dart';
import 'package:mobx/mobx.dart';

import '../interface/shared_preferences_service_interface.dart';
import '../service/shared_preferences_service.dart';
part 'questions_controller.g.dart';

class QuestionsStore = _QuestionsStoreBase with _$QuestionsStore;

abstract class _QuestionsStoreBase with Store {
  ApiSheetRepository _apiSheetRepository;
  final ISaredPrefsServiceInterface storage = SharedPrefsService.instance;

  _QuestionsStoreBase() {
    _apiSheetRepository = ApiSheetRepository();
  }

  @observable
  int corrects = 0;
  @observable
  int wrongs = 0;

  @action
  void saveData() async {
    await storage.put('index', questionNumber);
    await storage.put('hint', hints);
  }

  @action
  void getData() async {
    questionNumber = await storage.get('index') ?? 0;
    hints = await storage.get('hint') ?? 10;
    corrects = await storage.get('correct') ?? 0;
    wrongs = await storage.get('wrong') ?? 0;
  }

  @action
  void saveAnswer() async {
    selected
        ? await storage.put('correct', corrects++)
        : await storage.put('wrong', wrongs++);
  }

  @observable
  bool isLoading = false;

  @observable
  String message = '';

  @observable
  List<String> availableOptions = ['a', 'b', 'c', 'd'];

  @observable
  int hints = 10;

  @observable
  bool selected = false;

  @observable
  int lastUsed = 0;

  @observable
  ObservableList<Questions> questions = ObservableList<Questions>();

  @observable
  int questionNumber = 0;

  @action
  void setCurrentQuestion(int value) => questionNumber = value;

  @action
  void nextQuestion() {
    if (questionNumber < questions.length)
      questionNumber++;
    else
      questionNumber = 0;
  }

  @action
  Future<dynamic> fetchQuestions() async {
    try {
      isLoading = true;
      var response = await _apiSheetRepository.fetchData();
      if (response.status == 200) {
        var iterator = response.data.questions;
        questions.clear();
        questions.addAll(ObservableList<Questions>.of(iterator));
        return questions[questionNumber];
      } else {
        message = response.message;
        print(response.message);
        return message;
      }
    } catch (e) {
      print('Error Fetching Data on QuestionsController');
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  void checkAnswer() {
    saveAnswer();
    saveData();
    message = questions[questionNumber].message;
    nextQuestion();
  }

  @action
  void setHints(int hintValue) => hints = hintValue;

  @action
  void useHint() {
    if (lastUsed != questionNumber) {
      hints--;
      lastUsed = questionNumber;
    }
  }
}
