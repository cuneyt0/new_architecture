import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/app/domain/posts/usecase/fetch_posts_usecase.dart';
import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/app/domain/users/usecase/fetch_users.dart';
import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:architecture/core/error/sw_error.dart';
import 'package:architecture/core/firebase/analytics/analytics_manager.dart';
import 'package:architecture/core/firebase/crashlytics/crashlytics_manager.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';
import 'package:architecture/core/results/view_state.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SubUserViewModel extends BaseViewModel {
  String name="";


  SubUserViewModel(){
    updateName();
  }

  void updateName(){
    name = "Duzey";
  }
}
