part of 'job_details_cubit.dart';

@immutable
abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}
class JobDetailsGroupValue extends JobDetailsState {}
class JobDetailsLike extends JobDetailsState {}