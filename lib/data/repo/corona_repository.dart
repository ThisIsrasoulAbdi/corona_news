import 'package:corona_news/data/corona.dart';
import 'package:corona_news/data/dataSource/corona_dara_source.dart';
import 'common/httpclint_request.dart';

final coronaRepository = CoronaRepository(CoronaRemoteDataSource(httpClinet));

abstract class ICoronaRepository {
  Future<Result> getAll(String nameCounty);
}

class CoronaRepository implements ICoronaRepository {
  final ICoronaDataSource coronaDataSource;

  CoronaRepository(this.coronaDataSource);

  @override
  Future<Result> getAll(String nameCountry) =>
      coronaDataSource.getAll(nameCountry);
}
