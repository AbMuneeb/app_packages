import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pagination_widget/domain/models/pagination_states.dart';
import 'package:pagination_widget/domain/usecases/controller_usecase.dart';
import 'package:pagination_widget/domain/repoImpl/handle_list_repo_impl.dart';
import 'package:pagination_widget/domain/usecases/usecase_handle_list.dart';
import 'package:pagination_widget/utils/entended_pagination_bloc.dart';

class PaginationListBloc extends ExtendedPaginationCubit<GetPaginationState>
{
  late UseCaseHandleList useCase;
  late StreamController<GetPaginationState> _controller;
  StreamSubscription? _streamSubscription;
  late PaginationController _paginationController;

  PaginationListBloc(super.initialState,PaginationController paginationController){
    _paginationController = paginationController;
    _controller = StreamController();
    useCase = UseCaseHandleList(repo: HandleListRepoImpl(paginationController: paginationController,stateController: _controller));
  }

  restartPagination(PaginationController paginationController)
  {
    _controller = StreamController();
    useCase = UseCaseHandleList(repo: HandleListRepoImpl(paginationController: paginationController,stateController: _controller));
  }

  void fetchList(BuildContext context) {

    useCase.startGettingResult(context, GetPaginationStateStarted());
    _streamSubscription = _controller.stream.listen((event) {
      emit(event);
    });
  }

  PaginationController getPaginationController()
  {
    return _paginationController;
  }

  @override
  Future<void> close() {
    _controller.close();
    _streamSubscription?.cancel();
    return super.close();
  }


}