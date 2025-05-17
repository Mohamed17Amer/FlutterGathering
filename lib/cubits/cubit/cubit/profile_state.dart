part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfilePictureLoading extends ProfileState {}
final class ProfilePictureUpdated extends ProfileState {}
