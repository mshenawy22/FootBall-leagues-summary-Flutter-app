
import 'package:bt_assignment/models/matches_history.dart';
import 'package:bt_assignment/models/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'matches_repo_state.dart';



class MatchesRepoCubit extends Cubit<MatchesRepoState> {

  MatchesRepoCubit() : super(MatchesRepoState( teamWithMostWins: null, status: MatchesRepoStatus.initial));

  void fetching() async {
    emit (MatchesRepoState(status: MatchesRepoStatus.loading)) ;
    final matchservices = MatchServices();
    try {
      await matchservices.computeTeamWithMostWins();
      emit (MatchesRepoState(status:MatchesRepoStatus.success , teamWithMostWins : matchservices.teamWithMostWins()));
    }
    on Exception {
      emit(MatchesRepoState(status: MatchesRepoStatus.failure));
    }

  }

}
