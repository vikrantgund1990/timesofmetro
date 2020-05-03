import 'package:bloc/bloc.dart';
import 'package:timesofmetro/bloc/journeyinfo/journey_info_event.dart';
import 'package:timesofmetro/bloc/journeyinfo/journey_info_states.dart';

class JourneyInfoBloc extends Bloc<JourneyInfoEvent, JourneyInfoStates> {
  @override
  // TODO: implement initialState
  JourneyInfoStates get initialState => JourneyInfoInitialState();

  @override
  Stream<JourneyInfoStates> mapEventToState(JourneyInfoEvent event) async* {
    if (event is FetchJourneyInfo) {
      yield JourneyLoadingState();
      try {
        yield JourneyLoadedState(true);
      } catch (e) {
        yield JourneyErrorState("Error");
      }
    }
  }
}
