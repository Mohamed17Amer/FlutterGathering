part of 'create_group_cubit.dart';

@immutable
sealed class CreateGroupState {}

final class CreateGroupInitial extends CreateGroupState {}

final class CreateGroupSuccess extends CreateGroupState {}

final class GetFamilyGroupSuccess extends CreateGroupState {}
