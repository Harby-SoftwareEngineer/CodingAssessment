import '../../data/models/profile_dto.dart';

class Profile {
  String? idToken;
  String? refreshToken;
  String? expiresIn;
  String? localId;
  bool? registered;
  String? displayName;
  String? email;


  Profile({
    this.idToken,
    this.refreshToken,
    this.expiresIn,
    this.localId,
    this.registered,
    this.displayName,
    this.email,
  });

  factory Profile.fromDto(ProfileDto dto) {
    return Profile(
      idToken: dto.idToken,
      refreshToken: dto.refreshToken,
      expiresIn: dto.expiresIn,
      localId: dto.localId,
      registered: dto.registered,
      displayName: dto.displayName,
      email: dto.email,
    );
  }
}
