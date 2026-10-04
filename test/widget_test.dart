import 'package:flutter_test/flutter_test.dart';

import 'package:mmit_photo_booth/main.dart';

void main() {
  testWidgets('Photo booth welcome screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const PhotoBoothApp());

    expect(find.text('MMIT'), findsOneWidget);
    expect(find.text('PHOTO BOOTH'), findsOneWidget);
    expect(find.text('SHENOVA'), findsOneWidget);
    expect(find.text('START'), findsOneWidget);
  });
}
