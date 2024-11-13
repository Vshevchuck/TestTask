import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.g.dart';

@JsonSerializable()
class RefreshToken extends Equatable {
  final String refreshToken;

  const RefreshToken(this.refreshToken);

  factory RefreshToken.fromJson(Map<String, dynamic> json) {
    return _$RefreshTokenFromJson(json);
  }

  @override
  List<Object> get props => [refreshToken];

  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}
