import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  testWidgets('my widget has a text "Spent"', (tester) async {
    final MockBankHttp bankHttp = MockBankHttp();
    when(bankHttp.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: bankHttp.dolarToReal(),
          ),
        ),
      ),
    );
    final spendFinder = find.text('Spent');

    expect(spendFinder, findsOneWidget);
  });

  testWidgets('Find a LinearProgressIndicator', (tester) async {
    final MockBankHttp bankHttp = MockBankHttp();
    when(bankHttp.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: bankHttp.dolarToReal(),
          ),
        ),
      ),
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('Find a AccountStatus', (tester) async {
    final MockBankHttp bankHttp = MockBankHttp();
    when(bankHttp.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: bankHttp.dolarToReal(),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });

  testWidgets('Find 4 BoxCard', (tester) async {
    final MockBankHttp bankHttp = MockBankHttp();
    when(bankHttp.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: bankHttp.dolarToReal(),
          ),
        ),
      ),
    );

    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      }
      return false;
    }), findsNWidgets(5));
  });

  testWidgets('When tap Deposit, show upload eearnded in 10', (tester) async {
    final MockBankHttp bankHttp = MockBankHttp();
    when(bankHttp.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: bankHttp.dolarToReal(),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle(); // espera os micro-processamentos

    expect(find.text('\$10.0'), findsOneWidget);
  });

  testWidgets('Testing MockHttp dolarToReal', (tester) async {
    final MockBankHttp bankHttp = MockBankHttp();
    when(bankHttp.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: bankHttp.dolarToReal(),
          ),
        ),
      ),
    );

    verify(bankHttp.dolarToReal()).called(1);
  });
}
