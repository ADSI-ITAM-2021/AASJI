import 'package:mi_vacuna/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CurpViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  showResult() {
    final curp = 'XXXX010101XXAA';

    _dialogService
        .showDialog(
          title: 'Resultado',
          description: 'Tu CURP es:\n${curp}',
          dialogPlatform: DialogPlatform.Material,
        )
        .whenComplete(() => _navigationService.back(result: curp));
  }
}
