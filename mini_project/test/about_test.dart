import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project/screen/account_page.dart';
import 'package:mini_project/screen/achievement_page.dart';
import 'package:mini_project/screen/collection_page.dart';
import 'package:mini_project/screen/history_page.dart';
import 'package:mini_project/screen/home_page.dart';
import 'package:mini_project/screen/list_soal.dart';
import 'package:mini_project/screen/login_screen.dart';
import 'package:mini_project/screen/main_screen.dart';
import 'package:mini_project/screen/quiz_page.dart';

void main() {
  testWidgets('Tombol Login harus bertuliskan Log In',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    expect(find.text('Log In'), findsOneWidget);
  });
  testWidgets('Nama Halaman Harus Sansuumaru', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('Sansuumaru'), findsOneWidget);
  });
  testWidgets('Greeting Page harus "Hello User!! Welcome To Sansuumaru"',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Home(),
      ),
    );

    expect(find.text('Hello User!! Welcome To Sansuumaru'), findsOneWidget);
  });
  testWidgets('Tombol harus bertuliskan Logout', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Account(),
      ),
    );

    expect(find.text('Logout'), findsOneWidget);
  });
  testWidgets('Tombol harus bertuliskan Finish', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: QuizPage(
          grade: '',
          number: 0,
          session: 1,
          subject: '',
        ),
      ),
    );

    expect(find.text('Finish'), findsOneWidget);
  });

  testWidgets('Tombol pilihan harus Aljabar', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ListSoal(
          grade: '',
        ),
      ),
    );

    expect(find.text('Aljabar'), findsOneWidget);
  });
  testWidgets('Tombol pilihan harus Geometri', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ListSoal(
          grade: '',
        ),
      ),
    );

    expect(find.text('Geometri'), findsOneWidget);
  });
  testWidgets('Title harus Your Quiz History', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HistoryPage(),
      ),
    );

    expect(find.text('Your Quiz History'), findsOneWidget);
  });
  testWidgets('Title harus Shop', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HistoryPage(),
      ),
    );

    expect(find.text('Shop'), findsOneWidget);
  });
  testWidgets('Title harus My Achievement', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AchievementPage(),
      ),
    );

    expect(find.text('My Achievement'), findsOneWidget);
  });
  testWidgets('Title harus Events', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HistoryPage(),
      ),
    );

    expect(find.text('Events'), findsOneWidget);
  });
  testWidgets('Title harus My Collections', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    expect(find.text('My Collections'), findsOneWidget);
  });
}
