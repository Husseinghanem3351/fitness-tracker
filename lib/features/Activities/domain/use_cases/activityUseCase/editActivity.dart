import 'package:dartz/dartz.dart';

import '../../../../../global/errors/failure.dart';
import '../../entities/activity.dart';
import '../../repositories/ActivityRepository.dart';

 class EditActivityUseCase{
  ActivityRepository repository;
  EditActivityUseCase({required this.repository});

  Future<Either<Failure,Unit>> call(Activity activity) async{
    return await repository.editActivity(activity);
  }
}