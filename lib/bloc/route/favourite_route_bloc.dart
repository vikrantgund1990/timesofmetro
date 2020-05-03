import 'package:bloc/bloc.dart';
import 'package:timesofmetro/bloc/route/favourite_rout_list_event.dart';
import 'package:timesofmetro/bloc/route/favourite_route_list_states.dart';

class FavouriteRouteBloc
    extends Bloc<FavouriteRouteListEvent, FavouriteRouteListStates> {

  @override
  // TODO: implement initialState
  FavouriteRouteListStates get initialState => null;

  @override
  Stream<FavouriteRouteListStates> mapEventToState(
      FavouriteRouteListEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

}
