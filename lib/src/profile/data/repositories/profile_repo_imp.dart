
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repo.dart';
import '../data_sources/profile_datasource.dart';
import '../models/communication_dto.dart';
import '../models/profile_dto.dart';


@Injectable(as: ProfileRepo)
class ProfileRepoImp extends ProfileRepo{
  final ProfileDataSource  apiProvider;
  ProfileRepoImp(this.apiProvider);


  @override
  Future<Profile> fetchProfileData(bool isFromCash) async {
    ProfileDto profile = ProfileDto();
    if (isFromCash) {
      profile = await HelperMethods.getProfile();
    } else {
      final data = await apiProvider.fetchProfileData();
      profile = data.result!;
      await HelperMethods.saveProfile(profile);
    }
    return Profile.fromDto(profile);
  }

  @override
  Future<Profile> fetchProfile() async {
    ProfileDto profile = await HelperMethods.getProfile();
    if (profile.refreshToken != null){
      return Profile.fromDto(profile);
    } else {
      final data = await apiProvider.fetchProfileData();
      profile = data.result!;
      await HelperMethods.saveProfile(profile);
    }
    return Profile.fromDto(profile);
  }

  @override
  Future<String> editProfileData(ProfileDto params) async {
    final data = await apiProvider.editProfileData(params);
    await HelperMethods.saveProfile(data.result!);
    return data.message ?? '';
  }

  @override
  Future<String> editProfileImage(File file) async {
    final data = await apiProvider.editProfileImage(file);
    await HelperMethods.saveProfile(data.result!);
    return data.message ?? '';
  }

  @override
  Future<String> deleteProfileData() async {
    final response = await apiProvider.deleteProfileData();
    return response.message ?? '';
  }

  @override
  Future<String> logout() async {
     await HelperMethods.clearCashData();
    return '';
  }
}