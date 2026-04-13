import 'package:flutter_app/core/services/token_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/job_repository.dart';
import '../state/job_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  final EmployeeRepository repository;

  JobDetailsCubit(this.repository)
    : super(const JobDetailsState(isLoading: false)) {
    loadData();
  }

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));

    try {
      // final res = await repository.getUser(18);
      final id = await TokenService.getEmployeeId();

      if (id == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      final res = await repository.getUser(id);
      emit(
        state.copyWith(
          isLoading: false,
          employeeData: res, // ✅ direct model
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, employeeData: null));
    }
  }
}
// class JobDetailsCubit extends Cubit<JobDetailsState> {
//   final EmployeeRepository repository;

//   JobDetailsCubit(this.repository)
//       : super(const JobDetailsState()) {
//     loadData();
//   }

//   Future<void> loadData() async {
//     emit(state.copyWith(isLoading: true, error: null));

//     try {
//       final id = await TokenService.getEmployeeId();

//       if (id == null) {
//         emit(
//           state.copyWith(
//             isLoading: false,
//             error: "Employee ID not found",
//           ),
//         );
//         return;
//       }

//       final res = await repository.getUser(id);

//       emit(
//         state.copyWith(
//           isLoading: false,
//           employeeData: res,
//         ),
//       );
//     } catch (e) {
//       emit(
//         state.copyWith(
//           isLoading: false,
//           error: e.toString(),
//         ),
//       );
//     }
//   }
// }
