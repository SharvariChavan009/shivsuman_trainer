import 'package:car_trainer_application/features/auth/cubit/CheckEmailPassword/check_email_pass_cubit.dart';
import 'package:car_trainer_application/features/auth/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:car_trainer_application/features/auth/cubit/reset_password/reset_password_cubit.dart';
import 'package:car_trainer_application/features/auth/cubit/verify_otp/verify_otp_cubit.dart';
import 'package:car_trainer_application/features/home/change_password/cubit/change_password/change_password_cubit.dart';
import 'package:car_trainer_application/features/home/change_password/cubit/old_password_validation/old_password_cubit.dart';
import 'package:car_trainer_application/features/home/presentation/home_screen.dart';
import 'package:car_trainer_application/features/home/profile/cubit/edit_profile_details/edit_profile_details_cubit.dart';
import 'package:car_trainer_application/features/home/profile/cubit/get_profile_details/get_profile_details_cubit.dart';
import 'package:car_trainer_application/features/auth/bloc/menu_selection/menu_name_bloc.dart';
import 'package:car_trainer_application/core/common/cubits/Textfield_validation/textfield_validation_cubit.dart';
import 'package:car_trainer_application/core/common/cubits/confirm_password/confirmpassword_cubit.dart';
import 'package:car_trainer_application/core/common/cubits/email_validation/email_cubit.dart';
import 'package:car_trainer_application/core/common/cubits/mobile_validation/mobile_validation_cubit.dart';
import 'package:car_trainer_application/core/common/cubits/password_validation/login_cubit.dart';
import 'package:car_trainer_application/features/auth/presentation/login_screen.dart';
import 'package:car_trainer_application/features/home/settings/presentation/setting_screen.dart';
import 'package:car_trainer_application/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MenuNameBloc()),
        BlocProvider(create: (context) => EmailCubit()),
        BlocProvider(create: (context) => PasswordCubit()),
        BlocProvider(create: (context) => ConfirmpasswordCubit()),
        BlocProvider(create: (context) => TextfieldValidationCubit()),
        BlocProvider(create: (context) => MobileValidationCubit()),
        BlocProvider(create: (context) => CheckEmailPassCubit()),
        BlocProvider(create: (context) => GetProfileDetailsCubit()),
        BlocProvider(create: (context) => ForgotPasswordCubit()),
        BlocProvider(create: (context) => VerifyOtpCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => EditProfileDetailsCubit()),
        BlocProvider(create: (context) => OldPasswordCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),




   







      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Car - Trainer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
