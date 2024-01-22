import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_and_fond.dart';
import '../../../core/padding.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../widgets/tittle.dart';

class LoginWithOtpScreen extends StatelessWidget {
  const LoginWithOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        child: Form(
          //   key: context.read<AuthBloc>().loginPhnoNoKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Tittles(tittle: "Mobile OTP Login"),
              Padding(
                padding: Paddings.myPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Enter the 10 digit mobile number",
                        style: ColorAndFont.SM_TEXT,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller:
                          context.read<AuthCubit>().loginPhoneNoController,
                      validator: (value) {
                        String phoneNo = context
                            .read<AuthCubit>()
                            .loginPhoneNoController
                            .text;
                        if (phoneNo.isEmpty || phoneNo.length != 10) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: ColorAndFont.GREEN,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
