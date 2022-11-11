import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praetorium/model/model.dart';
import 'package:praetorium/model/team.dart';

class TeamsListBloc extends Bloc<TeamsListEvent, TeamsListState> {
  TeamsListBloc() : super(TeamsListState.empty()) {
    on<TeamsListEvent>((TeamsListEvent event, Emitter emit) {
      emit(TeamsListState(_teams));
    });
  }
}

class TeamsListEvent {}

class TeamsListState extends Equatable {
  final List<Team>? teams;

  const TeamsListState(this.teams);

  factory TeamsListState.empty() => const TeamsListState(null);

  @override
  List<Object?> get props => [teams];
}

final List<Team> _teams = [
  Team(
    'Gamma-Zhul-881',
    'Skitarii Kill Team',
    _models,
  ),
  Team('Exalted Scythe', 'Necrons', []),
  Team('Drop Force Imperator', 'Astra Militarum', []),
  Team('Sevenfold Stricken', 'Death Guard', []),
  Team('Kill Team Cassius', 'Deathwatch', []),
  Team('Kill Team Agrippus', 'Adeptus Astartes', []),
];

// FIXME: load from database
final List<Model> _models = [
  Model('Dorox-0.4343', 'Vanguard Alpha', 10),
  Model('Actus-1111', 'Skitarii Vanguard', 9),
  Model('Gryphone-Reductus-089', 'Skitarii Ranger', 10),
  Model('Sek-XXVII', 'Vanguard Gunner', 13),
  Model('Tov-66.75/mk98', 'Ranger Gunner', 13),
  Model('Decima-110', 'Skitarii Ranger', 9),
  Model('Mu-575', 'Skitarii Vanguard', 9),
];
