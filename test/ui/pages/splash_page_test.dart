import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:surveys/ui/pages/pages.dart';

import '../helpers/helpers.dart';
import '../mocks/mocks.dart';

void main() {
  late SplashPresenter presenter;
  late StreamController<String?> navigateToController;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = MockSplashPresenter();
    navigateToController = StreamController<String?>();

    when(presenter.navigateToStream)
        .thenAnswer((_) => navigateToController.stream);

    await tester.pumpWidget(makePage(
      path: '/',
      page: () => SplashPage(presenter: presenter),
    ));
  }

  tearDown(() => navigateToController.close());

  testWidgets(
    'Should present spinner on page load',
    (WidgetTester tester) async {
      await loadPage(tester);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'Should call checkAccount on page load',
    (WidgetTester tester) async {
      await loadPage(tester);

      verify(presenter.checkAccount()).called(1);
    },
  );

  testWidgets(
    'Should change page',
    (WidgetTester tester) async {
      await loadPage(tester);

      navigateToController.add('/any_route');
      await tester.pumpAndSettle();

      expect(currentRoute, '/any_route');
      expect(find.text('fake_page'), findsOneWidget);
    },
  );

  testWidgets(
    'Should not change page',
    (WidgetTester tester) async {
      await loadPage(tester);

      navigateToController.add('');
      await tester.pump();
      expect(currentRoute, '/');

      navigateToController.add(null);
      await tester.pump();
      expect(currentRoute, '/');
    },
  );
}
