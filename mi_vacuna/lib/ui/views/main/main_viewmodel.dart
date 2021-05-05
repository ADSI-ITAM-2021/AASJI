import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mi_vacuna/app/app.locator.dart';
import 'package:mi_vacuna/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  final GlobalKey<FormState> formKey = GlobalKey();

  String curp = '';

  validateCurp() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      final birthDate = DateFormat('yy-MM-dd').parse(curp.substring(4, 6) +
          '-' +
          curp.substring(6, 8) +
          '-' +
          curp.substring(8, 10));

      if ((birthDate.difference(DateTime.now()).inDays ~/ 360).abs() < 60) {
        _dialogService.showDialog(
          title: '¡Espera!',
          description:
              'Apenas estamos vacunando adultos mayores de 60 años, sigue las noticias para saber cuando te tocará.',
          dialogPlatform: DialogPlatform.Material,
        );
      } else {
        _navigationService.navigateTo(Routes.vacFormView);
      }
    }
  }

  goToCurp() async {
    final result = await _navigationService.navigateTo(Routes.curpView);

    if (result != null) {
      curp = result;

      notifyListeners();
    }
  }
}
