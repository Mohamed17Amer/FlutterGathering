part of 'phone_number_cubit.dart';

@immutable
sealed class PhoneNumberState {}

final class PhoneNumberInitial extends PhoneNumberState {}
final class PhoneNumberIsTyping extends PhoneNumberState {}
final class ChangeCountryCode extends PhoneNumberState {}
final class PhoneNumberError extends PhoneNumberState {}
