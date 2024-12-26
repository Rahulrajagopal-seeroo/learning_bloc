import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/payment_data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadChartData>(_onLoadChartData);
  }

  void _onLoadChartData(LoadChartData event, Emitter<HomeState> emit) async {
    emit(ChartDataLoading());
    try {
      // Simulate a delay for loading data
      await Future.delayed(const Duration(seconds: 1));
      final chartData = _getChartData(event.year);
      emit(ChartDataLoaded(chartData));
    } catch (e) {
      emit(ChartDataError("Failed to load chart data"));
    }
  }

  List<PaymentData> _getChartData(String year) {
    switch (year) {
      case '2023':
        return [
          PaymentData('Jan', 4, 2),
          PaymentData('Feb', 2, 1),
          PaymentData('Mar', 5, 1),
          PaymentData('Apr', 3, 1),
          PaymentData('May', 2, 1),
          PaymentData('Jun', 2, 1),
          PaymentData('Jul', 2, 2),
          PaymentData('Aug', 3, 3),
          PaymentData('Sep', 1, 1),
          PaymentData('Oct', 6, 2),
          PaymentData('Nov', 3, 4),
          PaymentData('Dec', 6, 2),
        ];
      case '2024':
        return [
          PaymentData('Jan', 3, 1),
          PaymentData('Feb', 4, 2),
          PaymentData('Mar', 6, 3),
          PaymentData('Apr', 5, 2),
          PaymentData('May', 4, 1),
          PaymentData('Jun', 3, 2),
          PaymentData('Jul', 5, 1),
          PaymentData('Aug', 4, 2),
          PaymentData('Sep', 3, 3),
          PaymentData('Oct', 5, 1),
          PaymentData('Nov', 4, 2),
          PaymentData('Dec', 5, 1),
        ];
      default:
        return [];
    }
  }
}
