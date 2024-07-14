import 'package:equatable/equatable.dart';

class SettingsEntity extends Equatable {
  final String? name;
  final String? privacyPoilcy;

  SettingsEntity({this.name, this.privacyPoilcy});

  @override
  List<Object> get props => [name!, privacyPoilcy!];
}
