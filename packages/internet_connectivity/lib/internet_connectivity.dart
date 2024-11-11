library internet_connectivity;

import 'dart:async';
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'src/domain/repo/internet_connectivity.dart';
part 'src/data/repoImpl/internet_connectivity_repo_impl.dart';
part 'src/presentation/bloc/internet_checker_bloc.dart';
part 'src/utils/enums.dart';
part 'src/utils/internet_connectivity_cubit.dart';
part 'src/presentation/ui/internet_connectivity_widget.dart';