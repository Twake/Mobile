import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:twake/repositories/add_workspace_repository.dart';

part 'add_workspace_state.dart';

class AddWorkspaceCubit extends Cubit<AddWorkspaceState> {
  final AddWorkspaceRepository repository;

  AddWorkspaceCubit(this.repository) : super(AddWorkspaceInitial());

  void create({
    @required String name,
  }) async {
    final result = await repository.create();
    if (result.isNotEmpty) {
      emit(Created(result));
    } else {
      emit(Error('Workspace creation failure!'));
    }
  }

  void updateMembers({
    @required String workspaceId,
    @required List<String> members,
  }) async {
    final result = await repository.updateMembers(
      members: members,
      workspaceId: workspaceId,
    );
    if (result) {
      emit(MembersUpdated(workspaceId: workspaceId, members: members));
    } else {
      emit(Error('Members update failure!'));
    }
  }

  void clear() {
    repository.clear();
  }
}