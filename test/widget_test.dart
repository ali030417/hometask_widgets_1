
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_fight_club/main.dart';
void runTestLesson1Task1() {
  testWidgets('module1', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(
      (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
      const Color.fromRGBO(213, 222, 240, 1),
      reason: "Виджет Scaffold имеет корректный цвет фона",
    );
  });
}


// void runTestLesson1Task2() {
//   testWidgets('module2', (WidgetTester tester) async {
//     const Color correctBackgroundColor = Colors.black38;
//     const Color correctBackgroundColor2 = Color(0x60000000);
//     await tester.pumpWidget(MyApp());
//
//     final coloredBoxInButtonFinder =
//         (text) => findTypeByTextOnlyInParentType(ColoredBox, text, BodyPartButton);
//
//     final List<ColoredBox> widgetsWithButtons = [
//       ...tester.widgetList(coloredBoxInButtonFinder("HEAD")),
//       ...tester.widgetList(coloredBoxInButtonFinder("TORSO")),
//       ...tester.widgetList(coloredBoxInButtonFinder("LEGS")),
//     ].cast<ColoredBox>().toList();
//     final Set<Color> allColors = widgetsWithButtons.map((e) => e.color).toSet();
//     expect(allColors, isNotEmpty);
//     expect(allColors.length, 1);
//     expect(allColors.single, isOneOrAnother(correctBackgroundColor, correctBackgroundColor2));
//   });
// }

void runTestLesson1Task3() {
  testWidgets('module3', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final List<Stack> stackWidgets =
    tester.widgetList<Stack>(find.byWidgetPredicate((widget) => widget is Stack)).toList();
    final Stack? stackWithThreeWidgets =
    stackWidgets.firstWhere((stack) => stack.children.length == 3);
    expect(stackWithThreeWidgets, isNotNull);
    final Widget? centeredWidget = stackWithThreeWidgets!.children.firstWhere((element) =>
    (element is Align && element.alignment == Alignment.center) || element is Center);
    expect(centeredWidget, isNotNull);
    expect(centeredWidget, isInstanceOf<Align>());
    expect((centeredWidget as Align).child, isInstanceOf<ColoredBox>());
    final ColoredBox coloredBox = centeredWidget.child as ColoredBox;
    expect(coloredBox.color, const Color(0xFF6D6D6D));
  });
}

void runTestLesson1Task4() {
  testWidgets('module4', (WidgetTester tester) async {
    const TextStyle correctStyle =
    const TextStyle(
        fontSize: 36, fontWeight: FontWeight.w500, color: Colors.white);
    await tester.pumpWidget(MyApp());
    final Text? text = tester
        .firstWidget(find.byWidgetPredicate((widget) => widget is Text &&
        widget.data == ""));
    expect(text, isNotNull);
    expect(text!.style, correctStyle);
  });
}

void runTestLesson1Task5() {
  testWidgets('module5', (WidgetTester tester) async {
    const TextStyle correctStyle =
    const TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.white);
    await tester.pumpWidget(MyApp());
    final Text? text = tester
        .firstWidget(find.byWidgetPredicate((widget) => widget is Text && widget.data == "START"));
    expect(text, isNotNull);
    expect(text!.style, correctStyle);
  });
}


void runTestLesson1Task6() {
  testWidgets('module6', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final List<Stack> stackWidgets =
    tester.widgetList<Stack>(find.byWidgetPredicate((widget) => widget is Stack)).toList();
    final Stack? stackWithThreeWidgets =
    stackWidgets.firstWhere((stack) => stack.children.length == 3);
    expect(stackWithThreeWidgets, isNotNull);
    final Widget? topWidget = stackWithThreeWidgets!.children
        .firstWhere((element) => element is Align && element.alignment == const Alignment(0, -0.8));
    expect(topWidget, isNotNull);
    final Widget? bottomWidget = stackWithThreeWidgets.children
        .firstWhere((element) => element is Align && element.alignment == const Alignment(0, 0.8));
    expect(bottomWidget, isNotNull);
  });
}
