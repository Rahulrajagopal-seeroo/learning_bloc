import 'package:equatable/equatable.dart';

import '../../../models/payment_data.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ChartDataLoading extends HomeState {}

class ChartDataLoaded extends HomeState {
  final List<PaymentData> chartData;

  ChartDataLoaded(this.chartData);

  @override
  List<Object> get props => [chartData];
}

class ChartDataError extends HomeState {
  final String error;

  ChartDataError(this.error);

  @override
  List<Object> get props => [error];
}
