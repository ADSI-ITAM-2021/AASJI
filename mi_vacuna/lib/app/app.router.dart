// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/curp/curp_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/vac_form/vac_form_view.dart';

class Routes {
  static const String mainView = '/';
  static const String vacFormView = '/vac-form-view';
  static const String curpView = '/curp-view';
  static const all = <String>{
    mainView,
    vacFormView,
    curpView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.vacFormView, page: VacFormView),
    RouteDef(Routes.curpView, page: CurpView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
    VacFormView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VacFormView(),
        settings: data,
      );
    },
    CurpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CurpView(),
        settings: data,
      );
    },
  };
}
