// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled3/main.dart';   // đường dẫn tới TravelApp của bạn
import 'package:flutter/material.dart';

void main() {
  testWidgets('Smoke test: app builds & shows HomePage',
          (WidgetTester tester) async {
        // Build app
        await tester.pumpWidget(const TravelApp());

        // Kiểm tra xem tiêu đề "Popular Destinations" xuất hiện
        expect(find.text('Popular Destinations'), findsOneWidget);

        // Kiểm tra xem ít nhất 1 DestinationCard được render
        expect(find.byType(Image), findsWidgets);
      });
}
