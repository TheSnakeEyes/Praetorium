import 'package:bloc/bloc.dart';
import 'package:faker/faker.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final Faker _faker = Faker();

  GlobalBloc() : super(GlobalState('???'));

  @override
  Stream<GlobalState> mapEventToState(GlobalEvent event) async* {
    yield GlobalState(_faker.food.cuisine());
  }

}