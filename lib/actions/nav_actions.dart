import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'nav_actions.g.dart';

@JsonSerializable()
class ChangeBottomNavAction {
  final int index;

  ChangeBottomNavAction({ @required this.index,});
  Map<String, dynamic> toJson() => _$ChangeBottomNavActionToJson(this);
}
