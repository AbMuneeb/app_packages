class RefreshTokenFormat
{
  String headerName;
  bool isBearer;
  RefreshTokenFormat({this.headerName = 'Authorization', this.isBearer = true});
}