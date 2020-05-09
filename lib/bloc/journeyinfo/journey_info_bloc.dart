import 'package:bloc/bloc.dart';
import 'package:timesofmetro/bloc/journeyinfo/journey_info_event.dart';
import 'package:timesofmetro/bloc/journeyinfo/journey_info_states.dart';
import 'package:timesofmetro/model/metro_info.dart';
import 'package:timesofmetro/network/api_provider.dart';

class JourneyInfoBloc extends Bloc<JourneyInfoEvent, JourneyInfoStates> {
  APIProvider provider = APIProvider();

  @override
  JourneyInfoStates get initialState => JourneyInfoInitialState();

  @override
  Stream<JourneyInfoStates> mapEventToState(JourneyInfoEvent event) async* {
    if (event is FetchJourneyInfo) {
      yield JourneyLoadingState();
      try {
        List<MetroInfo> metroInfo = await provider.fetchMetroInfo();
        yield JourneyLoadedState(metroInfo);
      } catch (e) {
        yield JourneyErrorState("Error");
      }
    }
  }
}
