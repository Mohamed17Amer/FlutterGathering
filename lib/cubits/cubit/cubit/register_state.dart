part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterSucceed extends RegisterState {}
final class RegisterFailed extends RegisterState {}

final class SendOTPSucced extends RegisterState {}
final class SendOTPFailed extends RegisterState {}
final class VerifyOTPSuccssed extends RegisterState {}
final class VerifyOTPFailed extends RegisterState {}