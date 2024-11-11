sealed class GetPaginationState
{}

class GetPaginationStateStarted<T> extends GetPaginationState
{
}

class GetPaginationStateDone<T> extends GetPaginationState
{
  List<T>? listData;
  GetPaginationStateDone({required this.listData});
}

class GetPaginationStatePagination<T> extends GetPaginationState
{
  List<T>? listData;
  GetPaginationStatePagination({this.listData});
}

class GetPaginationStateEmpty<T> extends GetPaginationState
{
  List<T>? listData;
  GetPaginationStateEmpty({this.listData});
}

class GetPaginationStateError<T> extends GetPaginationState
{
  T? errorMessage;
  GetPaginationStateError({this.errorMessage});
}

class GetPaginationStateNothing extends GetPaginationState
{

}
