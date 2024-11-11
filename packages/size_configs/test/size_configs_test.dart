
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:size_configs/size_configs.dart';

import 'utils/keys.dart';
import 'widgets/screen_one.dart';
import 'widgets/screen_two.dart';


// BuildContext _createContext(){
//   final context = MockBuildContextIs();
//   const mediaQuery = MediaQuery(
//     data: MediaQueryData(),
//     child: SizedBox(height: 600,width: 600,),
//   );
//   when(context.widget).thenReturn(const SizedBox());
//   when(context.findAncestorWidgetOfExactType()).thenReturn(mediaQuery);
//   when(context.dependOnInheritedWidgetOfExactType<MediaQuery>())
//       .thenReturn(mediaQuery);
//   when(context.getElementForInheritedWidgetOfExactType())
//       .thenReturn(InheritedElement(mediaQuery));
//
//   return context;
// }
//
//
// class MockBuildContextIs extends Mock implements BuildContext {}

void main() {

  testWidgets('Screen size package working', (WidgetTester tester) async {
    // Create a MaterialApp, wrapping your widget that requires MediaQuery
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          // Config SizeConfig with current BuildContext
          SizeConfig.instance.config(context);
          return const ScreenOne();
        },
      ),
    ));

    await tester.tap(find.byKey(Keys.buttonKey));
    await tester.pumpAndSettle(); // Wait for the navigation animation

    expect(find.byType(ScreenTwo), findsOneWidget);
    // Check if SizeConfig is configured properly
    expect(SizeConfig.instance.checkIfSizeConfigWorking(), true);
  });
}
