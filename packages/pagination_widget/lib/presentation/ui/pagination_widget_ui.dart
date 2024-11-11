
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_widget/domain/models/pagination_states.dart';
import 'package:pagination_widget/domain/usecases/controller_usecase.dart';
import 'package:pagination_widget/presentation/bloc/pagination_bloc.dart';

class GetPaginationWidget<T> extends StatelessWidget {
  final PaginationController paginationController;
  const GetPaginationWidget({required this.paginationController,super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PaginationListBloc>(create: (_) => PaginationListBloc(GetPaginationStateNothing(),paginationController))
        ],
        child: _BodyWidget(paginationController)
    );
  }
}

class _BodyWidget extends StatefulWidget {
  final PaginationController paginationController;
  const _BodyWidget(this.paginationController);

  @override
  State<_BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {

  PaginationRestartController restartController = PaginationRestartController();

  @override
  void initState() {
    restartController.restart = restart;
    widget.paginationController.restartController(restartController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<PaginationListBloc>(context,listen: false).fetchList(context);
    });
    super.initState();
  }
  restart()
  {
    //BlocProvider.of<PaginationListBloc>(context,listen: false).close();
    BlocProvider.of<PaginationListBloc>(context,listen: false).restartPagination(widget.paginationController);
    BlocProvider.of<PaginationListBloc>(context,listen: false).fetchList(context);
  }

  @override
  Widget build(BuildContext context) {
    PaginationListBloc getBloc = BlocProvider.of<PaginationListBloc>(context,listen: false);
    return BlocConsumer<PaginationListBloc,GetPaginationState>(
        listener: (context,data){},
        builder: (context,data) {
          if(data is GetPaginationStateDone || data is GetPaginationStatePagination)
          {
            PaginationListBloc getNotificationModelListener = BlocProvider.of<PaginationListBloc>(context,listen: false);

            List<dynamic>? listData = (data is GetPaginationStateDone)?(data).listData:(data as GetPaginationStatePagination).listData;
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification){
                // PrintLogs.print('${scrollNotification.metrics.pixels} ${scrollNotification.metrics.maxScrollExtent}');
                if(scrollNotification.metrics.pixels>0.0&&scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent-20)
                {
                  // PrintLogs.print('true');
                  getNotificationModelListener.useCase.updateStep(true, context);
                  return true;
                }
                else
                {
                  getNotificationModelListener.useCase.updateStep(false, context);
                  return false;
                }
              },
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: getBloc.getPaginationController().listTopPadding??0,bottom: getBloc.getPaginationController().listBottomPadding??0),
                  itemBuilder: (context, index){
                    if(getBloc.useCase.getIsReachEnd()&&index == getBloc.useCase.getList()!.length-1)
                      {
                        return getBloc.getPaginationController().skeletonItemBuilder(context,index);
                      }
                    else
                      {
                        return getBloc.getPaginationController().itemBuilder(context,index,listData?[index]);
                      }
                  },
                  separatorBuilder: (context,index)
                  {
                    return getBloc.getPaginationController().separatorBuilder??SizedBox(height: getBloc.getPaginationController().dividerBetweenListWidget??20,);
                  },
                  itemCount: getNotificationModelListener.useCase.getList()?.length??0
              ),
            );
          }
          else if(data is GetPaginationStateEmpty)
          {
            return getBloc.getPaginationController().emptyWidgetView;
          }
          else if(data is GetPaginationStateError)
          {
            return getBloc.getPaginationController().errorWidgetView;
          }
          else
          {
            return getBloc.getPaginationController().loaderWidgetView;
          }
        }
    );
  }
}
