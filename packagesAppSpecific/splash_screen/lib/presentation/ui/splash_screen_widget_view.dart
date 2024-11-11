part of 'package:splash_screen/splash_screen.dart';

class SplashScreenWidget extends StatelessWidget {
  final Widget childSplashBody;
  final Duration? extraDelay;
  final Future<void> Function()? extraMethodCall;
  final Future<void> Function(BuildContext context) callInitialMethodAfterMaterialApp;
  final Future<void> Function() moveToNextPage;
  const SplashScreenWidget({required this.callInitialMethodAfterMaterialApp,required this.childSplashBody,this.extraMethodCall,required this.moveToNextPage,this.extraDelay,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<SplashScreenBloc>(
            create: (_) => SplashScreenBloc(true,callInitialMethodAfterMaterialApp: callInitialMethodAfterMaterialApp),
            child: _BodyView(extraDelay: extraDelay,extraMethodCall: extraMethodCall,moveToNextPage: moveToNextPage,child: childSplashBody,)
        )
    );
  }
}

class _BodyView extends StatefulWidget {
  final Widget child;
  final Duration? extraDelay;
  final Future<void> Function()? extraMethodCall;
  final Future<void> Function() moveToNextPage;
  const _BodyView({required this.child,required this.moveToNextPage,this.extraMethodCall,this.extraDelay,super.key});

  @override
  State<_BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<_BodyView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callInitialMethods();
    });
    super.initState();
  }

  callInitialMethods()async
  {
    if(widget.extraDelay != null)
    {
      await Future.delayed(widget.extraDelay!);
    }
    await BlocProvider.of<SplashScreenBloc>(context,listen: false).callAppInitializers(context);
    if(widget.extraMethodCall != null)
    {
      widget.extraMethodCall!();
    }
    widget.moveToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SplashScreenBloc,bool>(
        listener: (context,data){},
        builder: (context, data) {
          if(data == true){
            return widget.child;
          }
          return Container(
            height: size.height,
            width: size.width,
            color: Color(0xffffffff),
          );
        }
    );
  }
}

