import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pagination_widget/domain/models/pagination_states.dart';

mixin GetPaginationClassesUpdated<T>
{

  bool reachedEnd = false;
  int page = 0;
  List<T>? dataList;
  late StreamController<GetPaginationState> stateController;
  late T type;

  resetInitialData();
  startGettingResult(BuildContext context, GetPaginationState status);
  reachedEndList(bool reached);

  passStateController(StreamController<GetPaginationState> stateController)
  {
    this.stateController = stateController;
  }

  receiveInitialData(List<T>? dataList,T type)
  {
    this.dataList = dataList;
    this.type = type;
  }

  updateStep(bool event,BuildContext context){
    if(reachedEnd==false&&event==true)
    {
      dataList?.add(type);
      reachedEndList(true);
      startGettingResult(context,GetPaginationStatePagination(listData: dataList));
    }
  }

  updatedResponseAtReachedEndList(GetPaginationState apiStatus){
    int? length = dataList?.length;
    if(apiStatus is GetPaginationStatePagination && length!=null && length>0)
    {
      dataList?.removeAt(length-1);
    }
    reachedEndPage(false);
  }

  makeListNull()
  {
    dataList = null;
    decrementPage();
  }

  resetList()
  {
    reachedEndPage(false);
    page = 1 ;
    dataList?.clear();
  }

  clearList()
  {
    dataList?.clear();
  }

  addAllList(List<T> list)
  {
    dataList?.addAll(list);
  }

  reachedEndPage(bool reached)
  {
    reachedEnd = reached;
  }

  resetPageCounter()
  {
    page = 1;
  }

  incrementPage()
  {
    page += 1;
  }

  decrementPage()
  {
    page -= 1;
  }

  disposeAll()
  {
    reachedEnd = false;
    page = 0;
    dataList = null;

  }
}
