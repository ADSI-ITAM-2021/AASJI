import 'package:mi_vacuna/app/app.locator.dart';
import 'package:mi_vacuna/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String curp = '';

  goToForm() {
    _navigationService.navigateTo(Routes.vacFormView);
  }

  goToCurp() async {
    final result = await _navigationService.navigateTo(Routes.curpView);

    if (result != null) {
      curp = result;

      notifyListeners();
    }
  }
}
