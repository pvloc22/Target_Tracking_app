import 'package:equatable/equatable.dart';

import '../../core/enums.dart';
import '../../data/model/task_model.dart';

class HomeState extends Equatable {
  final PostStatus postStatus;
  final String message;
  final List<Task> listTodayTasks;

  const HomeState(
      {this.postStatus = PostStatus.loading,
      this.listTodayTasks = const <Task>[],
      this.message = ''});

  HomeState copyWith(
      {List<Task>? listTodayTasks, PostStatus? postStatus, String? message}) {
    return HomeState(
      listTodayTasks: listTodayTasks ?? this.listTodayTasks,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [listTodayTasks, postStatus, message];
}

class InitialState extends HomeState {}