import 'package:corona_news/data/dataSource/common/validator.dart';
import 'package:dio/dio.dart';
import '../corona.dart';

abstract class ICoronaDataSource {
  Future<Result> getAll(String nameCountry);
}

class CoronaRemoteDataSource with Validator implements ICoronaDataSource {
  final Dio httpClinet;

  CoronaRemoteDataSource(this.httpClinet);
  @override
  Future<Result> getAll(String nameCountry) async {
    final reposnse = await httpClinet.get("?type=country&country=$nameCountry");
    validationReponse(reposnse);
    print(reposnse.data);
    final CoronaEntity coronaEntity = CoronaEntity.fromJson(reposnse.data);
    return coronaEntity.result;
  }
}
