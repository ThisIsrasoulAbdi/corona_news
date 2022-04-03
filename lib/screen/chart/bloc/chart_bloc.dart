import 'package:bloc/bloc.dart';
import 'package:corona_news/data/common/excption.dart';
import 'package:corona_news/data/corona.dart';
import 'package:corona_news/data/repo/corona_repository.dart';
import 'package:equatable/equatable.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final CoronaRepository coronaRepository;
  ChartBloc({required this.coronaRepository}) : super(ChartLoading()) {
    on<ChartEvent>((event, emit) async {
      if (event is ChartStarted || event is ChartRefresh) {
        try {
          emit(ChartLoading());
          final coronas = await coronaRepository.getAll("Iran");
          emit(ChartSuccsess(coronas: coronas));
        } catch (e) {
          emit(
            ChartErorre(
              appException: e is AppException ? e : AppException(),
            ),
          );
        }
      }
    });
  }
}
