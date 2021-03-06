part of 'chart_bloc.dart';

abstract class ChartEvent extends Equatable {
  const ChartEvent();

  @override
  List<Object> get props => [];
}

class ChartStarted extends ChartEvent {}

class ChartRefresh extends ChartEvent {}
