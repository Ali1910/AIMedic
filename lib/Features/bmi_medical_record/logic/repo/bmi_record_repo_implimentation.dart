import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/faliure.dart';
import 'package:gbsub/Features/bmi_medical_record/data/bmi_data_model.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/repo/bmi_record_repo.dart';

class BMIRecordRepoImpl extends BMIRecordrepo {
  final APiService aPiService;

  BMIRecordRepoImpl(this.aPiService);
  @override
  Future<Either<Failure, bool>> deleteBMI(int bmiId) async {
    try {
      await aPiService.delete(endpoint: '/BMI?BMIId=$bmiId');
      return right(true);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromdioException(ex));
      } else {
        return left(
          ServerFailure(
            ex.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BmiReads>>> fethcAllReadsForUser(
      int userId) async {
    List<BmiReads> reads = [];
    try {
      var response = await aPiService.get(
          endpoint: '/BMI/BMI Reads For user?userId=$userId');
      for (var element in response.data) {
        BmiReads read = BmiReads.json(element);
        reads.add(read);
      }
      return right(reads);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromdioException(ex));
      } else {
        return left(
          ServerFailure(
            ex.toString(),
          ),
        );
      }
    }
  }
}
