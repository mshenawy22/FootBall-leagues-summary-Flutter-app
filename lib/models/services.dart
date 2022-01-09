import 'package:http/http.dart' as http;

import 'matches_history.dart';



class  MatchServices  {

  static const _baseUrl = 'api.football-data.org';
  static const String _GET_MATCHES = '/v2/competitions/2002/matches/';
  static const Map<String, String> _QUERY_PARAMS =
  {
    'dateFrom' : '2021-12-08',
    'dateTo'   : '2022-01-09',
    'status'   :  'FINISHED'
  };

  Future<MatchesHistory> getMatchesList() async {
    Uri uri = Uri.https(_baseUrl, _GET_MATCHES , _QUERY_PARAMS);
    print (uri);

    final response = await http.get(
      uri,
      headers: {
        'X-Auth-Token': 'cd029676c88b495da48839aefb25702c',
      },
    );

    return MatchesHistory.fromJson(response.body);

  }







}



