// Author : Jay Shenawy
//email : jay.shenawy@outlook.com

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/matches/matches_repo_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Cubit/teams/teams_repo_cubit.dart';
import 'services/matches_services.dart';
import 'dart:developer' as developer;

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
          providers: [
            BlocProvider<MatchesRepoCubit>(
              create: (context) => MatchesRepoCubit(),
            ),
            BlocProvider<TeamsRepoCubit>(
              create: (context) => TeamsRepoCubit(),
            ),

          ],
          child:
          MaterialApp(
            title: 'BT Assignment',
            theme: ThemeData(
              // Define the default brightness and colors.
              primaryColor:Colors.black ,
              brightness: Brightness.dark,
              scaffoldBackgroundColor:  Colors.amber,
              dividerColor:  Colors.white,
              primaryTextTheme: const TextTheme(
                headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black87),
                headline2: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold , color: Colors.blue ),
                headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold , color: Colors.blue ),
                bodyText1: TextStyle(fontSize: 20.0, fontFamily: 'Hind', color:Colors.black87 ),
              ),

              // Define the default font family.
              fontFamily: 'Georgia',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme : AppBarTheme(titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
              // Define the default `TextTheme`. Use this to specify the default
              // text styling for headlines, titles, bodies of text, and more.

            ),

            home:
            MyHomePage(title: 'BT Assignment'),
          )
      );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {

    BlocProvider.of<MatchesRepoCubit>(context).fetchWinnerbyMatches();

  }


  @override
  Widget build(BuildContext context) {

    // var match_services =  MatchServices();
    // MatchesHistory matchesHistory =  match_services.getMatchesList();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:

      Container (
        margin: EdgeInsets.all(10),
        decoration :  ShapeDecoration(
            shape:
            Border.all(width: 2.0, color: Theme.of(context).dividerColor)
        ),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(height: 30),
                BlocConsumer<MatchesRepoCubit, MatchesRepoState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state.status == MatchesRepoStatus.FETCHING_MATCHES)
                        return Text('Still loading');
                      else if (state.status ==
                          MatchesRepoStatus.WINNER_COMPUTED) {
                        BlocProvider.of<TeamsRepoCubit>(context).fetchTeamInfo(
                            state.teamWithMostWins!.teamBasicInfo.id!);
                        return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            child: Center(
                                child: Column(children: [
                              Text(
                                  '${state.teamWithMostWins!.competition!.name}',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3),
                              Container(height: 20),
                              Text(
                                  'Team with the most wins in last 30 days is : ',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline1),
                              Container(height: 20),
                              Text(
                                '${state.teamWithMostWins?.teamBasicInfo.name} with ${state.teamWithMostWins?.numofWins} wins.',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                              ),
                              BlocConsumer<TeamsRepoCubit, TeamsRepoState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    if (state.status ==
                                        TeamsRepoStatus.TEAM_INFO_SUCCESS) {
                                      return Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          state.teamAllInfo!.crestUrl!
                                                  .contains('svg')
                                              ? SvgPicture.network(
                                                  state.teamAllInfo!.crestUrl!)
                                              : Container(
                                                  width: 150,
                                                  height: 150,
                                                  child: Image.network(state
                                                      .teamAllInfo!.crestUrl!)),
                                          Container(
                                            height: 20,
                                          ),
                                          Container(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Pitch :${state.teamAllInfo!.venue}',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyText1),
                                              Container(
                                                height: 10,
                                              ),
                                              Text(
                                                  'Founded :${state.teamAllInfo!.founded}',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyText1),
                                              Container(
                                                height: 10,
                                              ),
                                              Text(
                                                  'Website :${state.teamAllInfo!.website}',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyText1),
                                              Container(
                                                height: 10,
                                              ),
                                              Text(
                                                  'Club Address :${state.teamAllInfo!.address}',
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyText1)
                                            ],
                                          ))
                                        ],
                                      ));
                                    } else if (state.status ==
                                        TeamsRepoStatus.FETCHING_TEAM_INFO)
                                      return Text('loading');
                                    else {
                                      return Text('Error');
                                    }
                                  })
                            ])));
                      } else
                        return Text('Error');
                    })
              ],
            ),
          ),
        ));
  }
}
