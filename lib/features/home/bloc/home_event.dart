import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadChartData extends HomeEvent {
  final String year;

  LoadChartData(this.year);

  @override
  List<Object> get props => [year];
}
