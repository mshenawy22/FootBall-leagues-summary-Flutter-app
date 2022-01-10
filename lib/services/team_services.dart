
import 'package:bt_assignment/models/team.dart';
import 'api_config.dart';
import 'dart:core';
export 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class TeamServices {

  TeamServices(this.id);

  TeamModel? team;
  int id;




  findbyID(int id) async
  {
    var _get_team_id = GET_TEAM +'${id}' ;
    Uri uri = Uri.https(BASE_URL,_get_team_id);

    developer.log(uri.toString(), name: 'just logging');
    print(uri.toString());

    final response = await  http.get(
      uri,
      headers: {
        'X-Auth-Token': 'cd029676c88b495da48839aefb25702c',
      },
    );

    this.team =   TeamModel.fromJson(response.body);

  }



}



