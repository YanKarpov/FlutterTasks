import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_users.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;

  UserBloc({required this.getUsers}) : super(UserInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoading());
      final result = await getUsers(NoParams());
      result.fold(
        (failure) => emit(UserError("Failed to fetch users")),
        (users) => emit(UserLoaded(users)),
      );
    });
  }
}
