import 'package:mi_vacuna/ui/views/curp/curp_view.dart';
import 'package:mi_vacuna/ui/views/main/main_view.dart';
import 'package:mi_vacuna/ui/views/vac_form/vac_form_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: MainView, initial: true),
    MaterialRoute(page: VacFormView),
    MaterialRoute(page: CurpView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {}
