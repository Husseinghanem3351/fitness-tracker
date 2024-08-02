import '../../../../../global/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../entities/activity.dart';
import '../../repositories/ActivityRepository.dart';

 class AddActivityUseCase{
ActivityRepository repository;
AddActivityUseCase({required this.repository});

Future<Either<Failure,Unit>> call(Activity activity) async{
  return await repository.addActivity(activity);
}
}