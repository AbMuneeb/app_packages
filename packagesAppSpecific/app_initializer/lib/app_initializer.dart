library app_initializer;

import 'package:app_initializer/module/locale_change/locale_change_listener.dart';
import 'package:app_initializer/module/themeListener/model/theme_change_model.dart';
import 'package:app_initializer/module/themeListener/theme_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

part 'package:app_initializer/src/domain/repo/app_intiializer_controller_repo.dart';
part 'package:app_initializer/src/data/repoImpl/app_initializer_controller_impl.dart';
part 'package:app_initializer/src/domain/usecase/usecaseRepo/app_init_usecase_repo.dart';
part 'package:app_initializer/src/domain/usecase/app_init_controller_usecase.dart';
part 'package:app_initializer/src/presentation/ui/app_initializer_widget.dart';
part 'package:app_initializer/src/utils/global_context.dart';
