
import 'dart:io';

import 'package:app/src/profile/data/models/profile_dto.dart';

import '../../data/models/communication_dto.dart';
import '../entities/profile.dart';

abstract class ProfileRepo{
  Future<Profile> fetchProfileData(bool isFromCash);
  Future<Profile> fetchProfile();
  Future<String> editProfileData(ProfileDto params);
  Future<String> editProfileImage(File file);
  Future<String> deleteProfileData();
  Future<String> logout();
}
