// Author : Jay Shenawy
//email : jay.shenawy@outlook.com

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/matches_repo_cubit.dart';
import 'models/matches_history.dart';
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

          ],
          child:
          MaterialApp(
            title: 'BT Assignment',
            theme: ThemeData(
              // Define the default brightness and colors.
              primaryColor:Colors.black ,
              brightness: Brightness.dark,
              scaffoldBackgroundColor:  Colors.amber,
              primaryTextTheme: const TextTheme(
                headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                headline2: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold , color: Colors.blue ),
                bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
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

    BlocProvider.of<MatchesRepoCubit>(context).fetching();

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<MatchesRepoCubit, MatchesRepoState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if(state.status== MatchesRepoStatus.loading)
                return Text('Still loading');

              else if (state.status== MatchesRepoStatus.success)
                return
              Container (
                padding: EdgeInsets.symmetric(horizontal: 10),
              child :
                  Center (
                      child :   Column (

                        children: [
                          Text( 'Team with the most wins in last 30 days is : ',
                              style : Theme.of(context).primaryTextTheme.headline1),
                          Text('${state.teamWithMostWins?.name} with ${state.teamWithMostWins?.numofWins} wins.',
                            style: Theme.of(context).primaryTextTheme.headline2,
                          )
                        ]
                    )
                  )


              );



              else
                return Text('Failed');

            })

          ],
        ),
      ),

    );
  }
}
