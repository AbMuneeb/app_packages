import 'package:flutter/material.dart';
import 'package:pagination_widget/domain/models/pagination_states.dart';
import 'package:pagination_widget/domain/repo/handle_list_repo.dart';

class UseCaseHandleList<T>
{
  HandleListRepo repo;

  UseCaseHandleList({required this.repo});

  startGettingResult(BuildContext context, GetPaginationState status){
    return repo.fetchListApi(context,status);
  }

  List<dynamic>? getList(){
    return repo.getList();
  }
  updateStep(bool value, BuildContext context)
  {
    repo.updateStepNow(value, context);
  }
  getIsReachEnd()
  {
    return repo.isReachEnd();
  }
}