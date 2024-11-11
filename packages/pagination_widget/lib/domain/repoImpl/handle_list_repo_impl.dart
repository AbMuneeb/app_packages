import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pagination_widget/domain/models/api_response.dart';
import 'package:pagination_widget/domain/models/pagination_api_states.dart';
import 'package:pagination_widget/domain/repo/handle_list_repo.dart';
import 'package:pagination_widget/domain/usecases/controller_usecase.dart';
import 'package:pagination_widget/utils/pagination_classes_updated.dart';
import 'package:pagination_widget/domain/models/pagination_states.dart';

class HandleListRepoImpl<T> extends HandleListRepo with GetPaginationClassesUpdated<T>
{
  late PaginationController paginationController;

  GetPaginationState appState = GetPaginationStateNothing();

  HandleListRepoImpl({
    required this.paginationController,
    required StreamController<GetPaginationState> stateController
  }){
    this.stateController = stateController;
  }

  @override
  fetchListApi(BuildContext context, GetPaginationState status) {
    startGettingResult(context,status);
  }

  @override
  List<T>? getList() {
    return dataList;
  }

  @override
  startGettingResult(BuildContext context, GetPaginationState status) async {

    resetInitialData();

    appState = status;
    incrementPage(); ///Whenever user hit the api default page number we set is 0. So to increment that page to 1 we call this method. Why? because our every list API start getting list from page number 1 so if this api again get called then it will increment to 1,2,3... ;

    if(appState is GetPaginationStateStarted)
    {
      resetList();  /// When first time api gets hit we clear our list and set our page number to 0
    }
    stateController.add(appState);

    PaginationApiResponse apiResponse = await paginationController.fetchFromApiMethodImplementation(page);

    // print('pagination 0 ${apiResponse.data}');
    if(apiResponse.apiStatus is PaginationApiStateDone)
    {
      // print('pagination 1 ${apiResponse.data}');
      updatedResponseAtReachedEndList(appState); /// Because when user reached to End of Page we show a empty CARD view then we have to remove that Empty card so we are removing that card here;
      addAllList(apiResponse.data!.toList()); /// New data is inserting in list
      appState = GetPaginationStateDone(listData: dataList);
      stateController.add(GetPaginationStateDone(listData: dataList));
    }
    else if(apiResponse.apiStatus is PaginationApiStateEmpty&&dataList!=null&&dataList!.isNotEmpty)
    {
      // print('pagination 2 ${apiResponse.data}');
      updatedResponseAtReachedEndList(appState); /// Again removing empty card here as mentioned above
      appState = GetPaginationStateDone(listData: dataList);
      decrementPage(); /// Because no new data was found so we have to minus the page number
      stateController.add(GetPaginationStateDone(listData: dataList));
    }
    else if(apiResponse.apiStatus is PaginationApiStateEmpty)
    {
      appState = GetPaginationStateEmpty();
      updatedResponseAtReachedEndList(appState); /// Again removing empty card here as mentioned above
      makeListNull(); /// But making list null
      stateController.add(GetPaginationStateEmpty());
    }
    else
    {
      appState = GetPaginationStateError();
      updatedResponseAtReachedEndList(appState); /// Again removing empty card here as mentioned above
      makeListNull(); /// But making list null
      stateController.add(GetPaginationStateError());

    }
  }

  @override
  reachedEndList(bool reached) {
    reachedEndPage(reached);
    stateController.add(appState);
  }

  @override
  resetInitialData() {
    /// This method get called from start method
    dataList ??= List.empty(growable: true); /// If list null then create list
    receiveInitialData(dataList,paginationController.listClassName.callCConstructor()); /// pass this list to Pagination Mixin class
  }

  @override
  updateStepNow(bool value, BuildContext context) {
    updateStep(value, context);
  }

  @override
  bool isReachEnd() {
    return reachedEnd;
  }

}