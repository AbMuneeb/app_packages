import 'package:pagination_widget/domain/models/pagination_api_states.dart';

class PaginationApiResponse<T>
{

  PaginationApiState? apiStatus;
  T? data;

  PaginationApiResponse({this.apiStatus, this.data});

}