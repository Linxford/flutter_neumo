import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

void main() {
  test('NeumoThemeData has correct default values', () {
    const theme = NeumoThemeData();

    expect(theme.depth, equals(4.0));
    expect(theme.intensity, equals(0.5));
    expect(theme.lightSource, equals(LightSource.topLeft));
  });

  test('NeumoColors has defined accent color', () {
    expect(NeumoColors.accent, isNotNull);
  });

  testWidgets('NeumoTheme can be created', (WidgetTester tester) async {
    await tester.pumpWidget(
      const NeumoTheme(
        theme: NeumoThemeData(),
        child: SizedBox(),
      ),
    );

    expect(find.byType(NeumoTheme), findsOneWidget);
  });
}
