class CoronaEntity {
  bool? ok;
  Result result;

  CoronaEntity({required this.ok, required this.result});

  CoronaEntity.fromJson(Map<String, dynamic> json)
      : ok = json['ok'],
        result = Result.fromJson(json['result']);
}

class Result {
  String? lastUpdated;
//  Null continent;
  String? country;
  String? cases;
  String? deaths;
  String? recovered;
  String? channel;

  Result(
      {required this.lastUpdated,
      //  required this.continent,
      required this.country,
      required this.cases,
      required this.deaths,
      required this.recovered,
      required this.channel});

  Result.fromJson(Map<String, dynamic> json)
      : lastUpdated = json['last_updated'],
        // ignore: unnecessary_null_in_if_null_operators
        //  continent = json['continent'] ?? null,
        country = json['country'],
        cases = json['cases'],
        deaths = json['deaths'],
        recovered = json['recovered'],
        channel = json['channel'];
}
