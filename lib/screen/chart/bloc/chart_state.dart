part of 'chart_bloc.dart';

abstract class ChartState extends Equatable {
  const ChartState();

  @override
  List<Object> get props => [];
}

class ChartLoading extends ChartState {}

class ChartErorre extends ChartState {
  final AppException appException;
  const ChartErorre({required this.appException});

  @override
  List<Object> get props => [appException];
}

class ChartSuccsess extends ChartState {
  final Result coronas;
  const ChartSuccsess({required this.coronas});
}
