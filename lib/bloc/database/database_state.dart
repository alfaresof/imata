
// import 'package:equatable/equatable.dart';

enum DatabaseStatus { initial, loading, success, error }

// extends Equatable
class DatabaseState {
  final String description;
  final List<String> location;
  final String photoPath;
  final String id;
  final DatabaseStatus status;
  const DatabaseState({
    required this.id,
    required this.description,
    required this.location,
    required this.status,
    required this.photoPath,
  });
  factory DatabaseState.initial() {
    return const DatabaseState(id: '',description: '',location: [],photoPath: '', status: DatabaseStatus.initial);
  }

  DatabaseState copyWith({
    String? description,
    List<String>? location,
    String? photoPath,
    String? id,
    DatabaseStatus? status,
  }) {
    return DatabaseState(
        id: id ?? this.id,
        description: description ?? this.description,
        location: location ??this.location,
        photoPath: photoPath ?? this.photoPath,
        status: status ?? this.status,
    );
  }

  bool get isValid => photoPath.isNotEmpty && location.isNotEmpty;

  @override
  List<Object> get props => [photoPath,description,id,location, status];
}
