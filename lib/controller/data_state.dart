part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}
class DataSignLoading extends DataState {}
class DataSignSuccess extends DataState {}
class DataSignFailure extends DataState {}
class DataJobLoading extends DataState {}
class DataJobSuccess extends DataState {}
class DataJobFailure extends DataState {}
class DataShowLoadingFavorites extends DataState {}
class DataShowFavorites extends DataState {}
class DataDeleteLoadingFavorites extends DataState {}
class DataDeleteFavorites extends DataState {}
class LocalListFav extends DataState {}
class Likes extends DataState {}
class JobDetailsGroupValue extends DataState {}
class IndexLisener extends DataState {}