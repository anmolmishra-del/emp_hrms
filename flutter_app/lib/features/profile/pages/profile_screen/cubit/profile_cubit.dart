import 'package:flutter_app/features/profile/pages/profile_screen/repository/profile_repository.dart';
import 'package:flutter_app/features/profile/pages/profile_screen/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(const ProfileState());

  Future<void> loadProfile() async {
    emit(state.copyWith(isLoading: true));

    try {
      final user = await repository.getUser(18);

      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
