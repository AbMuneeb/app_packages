part of 'package:flutter_bloc_extended/flutter_bloc_extended.dart';

class ExtendedMultiBlocProvider extends StatelessWidget {
  final List<BlocProvider> providers;
  final BuilderWidget builder;
  const ExtendedMultiBlocProvider({required this.providers,required this.builder,super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: providers, child: Builder(builder: (context) => tabBodyBuilderWidget(context,builder),));
  }
}

typedef BuilderWidget = Widget Function(BuildContext context);

Widget tabBodyBuilderWidget(BuildContext context, BuilderWidget builder) {
  return builder(context);
}