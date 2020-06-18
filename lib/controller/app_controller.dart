import 'package:ce_tenta_quizz/interface/shared_preferences_service_interface.dart';
import 'package:ce_tenta_quizz/service/shared_preferences_service.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final ISaredPrefsServiceInterface storage = SharedPrefsService.instance;
}
