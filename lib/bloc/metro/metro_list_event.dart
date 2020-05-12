import 'package:equatable/equatable.dart';
import 'package:timesofmetro/model/metro_info.dart';

abstract class MetroListEvent extends Equatable {}

class RefreshMetroList extends MetroListEvent {
  final List<MetroInfo> metroInfo;

  RefreshMetroList(this.metroInfo);

  @override
  List<Object> get props => [metroInfo];
}
