
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/repo/database/base_database.dart';
import 'database_state.dart';
class DatabaseCubit extends Cubit<DatabaseState> {
  final DatabaseRepositry _db;
  DatabaseCubit({required DatabaseRepositry db}): _db = db ,super(DatabaseState.initial());

  void descriptonChange(String value) {
    emit(state.copyWith(description: value, status: DatabaseStatus.initial));
  }
  void photoPathChange(String value) {
    emit(state.copyWith(photoPath: value, status: DatabaseStatus.initial));
  }
  void idSet(String value) {
    emit(state.copyWith(id: value, status: DatabaseStatus.initial));
  }
  void locationChange(List<String> value) {
    emit(state.copyWith(location: value, status: DatabaseStatus.initial));
  }
  void submite() {
    emit(state.copyWith(status: DatabaseStatus.initial));
  }
  void getData(String value) {
    emit(state.copyWith(description: value, status: DatabaseStatus.initial));
  }






}
