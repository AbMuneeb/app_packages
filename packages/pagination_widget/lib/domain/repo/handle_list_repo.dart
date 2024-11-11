import 'package:flutter/material.dart';
import 'package:pagination_widget/domain/models/pagination_states.dart';

abstract class HandleListRepo<T>
{
  List<T>? getList();
  fetchListApi(BuildContext context, GetPaginationState status);
  updateStepNow(bool value, BuildContext context);
  bool isReachEnd();
}