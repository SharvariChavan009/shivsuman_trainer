part of 'verify_otp_cubit.dart';

@immutable
sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}

final class VerifyOTPSuccessState extends VerifyOtpState {}

final class VerifyOTPErrorState extends VerifyOtpState {}

final class VerifyOTPLoadingState extends VerifyOtpState {}
