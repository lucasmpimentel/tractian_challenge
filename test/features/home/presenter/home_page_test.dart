import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';
import 'package:tractian_challenge/features/home/presenter/home_page.dart';
import 'package:tractian_challenge/features/home/presenter/cubit/home_cubit.dart';
import 'package:tractian_challenge/features/home/presenter/cubit/home_states.dart';


class MockHomeCubit extends Mock implements HomeCubit {}



@GenerateMocks([HomeCubit])
void main() {
  late MockHomeCubit mockHomeCubit;

  setUp(() {
    mockHomeCubit = MockHomeCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: HomePage(mockHomeCubit),
    );
  }

  testWidgets('displays loading indicator when state is HomeLoadingState', (WidgetTester tester) async {
    when(mockHomeCubit.state).thenReturn(HomeLoadingState());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays locations list when state is HomeSuccessState', (WidgetTester tester) async {
    final locations = [
      ResultCompany(id: '1', name: 'Location 1'),
      ResultCompany(id: '2', name: 'Location 2'),
    ];

    when(mockHomeCubit.state).thenReturn(HomeSuccessState(locations));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Location 1 Unit'), findsOneWidget);
    expect(find.text('Location 2 Unit'), findsOneWidget);
  });

  testWidgets('displays error message when state is HomeErrorState', (WidgetTester tester) async {
    when(mockHomeCubit.state).thenReturn(HomeErrorState('An error occurred'));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('ERROR'), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('navigates to assets page on location tap', (WidgetTester tester) async {
    final locations = [
      ResultCompany(id: '1', name: 'Location 1'),
    ];

    when(mockHomeCubit.state).thenReturn(HomeSuccessState(locations));

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.text('Location 1 Unit'));
    await tester.pumpAndSettle();

    // Add your navigation verification here
  });
}