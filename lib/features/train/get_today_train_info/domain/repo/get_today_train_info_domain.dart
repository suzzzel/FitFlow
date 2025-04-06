// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_today_train_info/data/repo/get_today_train_info.dart';
import 'package:fitflow/features/train/get_today_train_info/domain/repo/get_today_train_info_domain_impl.dart';

class GetTodayTrainInfoDomain implements GetTodayTrainInfoDomainImpl {
  final GetTodayTrainInfoData getTodayTrainInfoData;
  GetTodayTrainInfoDomain({
    required this.getTodayTrainInfoData,
  });
  @override
  Future<TrainingDayClass> getTodayTrainInfo() async {
    return await getTodayTrainInfoData.getTodayTrainInfo();
  }
}
