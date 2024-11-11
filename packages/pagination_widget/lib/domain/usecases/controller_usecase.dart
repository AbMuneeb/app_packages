import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pagination_widget/domain/models/api_response.dart';
import 'package:pagination_widget/domain/models/pagination_class_contructor.dart';

class PaginationController<T>
{
  Future<PaginationApiResponse> Function(int page) fetchFromApiMethodImplementation;
  PaginationClassType listClassName;
  Widget Function(BuildContext context, int index, T? data) itemBuilder;
  Widget Function(BuildContext context, int index) skeletonItemBuilder;
  Widget emptyWidgetView;
  Function(PaginationRestartController) restartController;
  Widget errorWidgetView;
  Widget loaderWidgetView;
  Widget? separatorBuilder;
  double? listTopPadding;
  double? listBottomPadding;
  double? dividerBetweenListWidget;

  PaginationController({
    required this.itemBuilder,
    required this.skeletonItemBuilder,
    required this.listClassName,
    required this.restartController,
    required this.fetchFromApiMethodImplementation,
    required this.emptyWidgetView,
    required this.errorWidgetView,
    required this.loaderWidgetView,
    this.listTopPadding,
    this.listBottomPadding,
    this.dividerBetweenListWidget,
    this.separatorBuilder,
  });


}

class PaginationRestartController
{
  VoidCallback? restart;

  restartPage()
  {
    if(restart != null)
    {
      restart!();
    }
  }
}