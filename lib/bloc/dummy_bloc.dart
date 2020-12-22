import 'package:bloc/bloc.dart';
import 'package:faker/faker.dart';

part 'dummy_event.dart';
part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  final Faker _faker = Faker();

  DummyBloc() : super(DummyState());

  @override
  Stream<DummyState> mapEventToState(DummyEvent event) async* {
    yield DummyState(items: state.items + _faker.lorem.words(event.count));
  }

}