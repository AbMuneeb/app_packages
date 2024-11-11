part of 'package:internet_connectivity/internet_connectivity.dart';

class InternetConnectivityWidget extends StatelessWidget {
  final Widget child;
  final Widget noInternetWidget;
  const InternetConnectivityWidget({required this.child,required this.noInternetWidget,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetConnectivityBloc,bool>(
      listener: (context, data){},
      builder: (context, isInternetAvailable) {
        if(isInternetAvailable) {
          return child;
        }
        return noInternetWidget;
      }
    );
  }
}
