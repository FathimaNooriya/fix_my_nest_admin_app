import 'package:fix_my_nest_admin_app/auth/presentation/pages/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_and_fond.dart';
import '../../../core/padding.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../widgets/my_button1.dart';
import '../widgets/text_with_link.dart';
import '../widgets/tittle.dart';
import 'admim_signin_screen.dart';

class LoginWithOtpScreen extends StatelessWidget {
  const LoginWithOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .5,
            child: Padding(
              padding: Paddings.myPadding,
              child: Form(
                key: context.read<AuthCubit>().loginPhnoNoKey,
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
                            controller: context
                                .read<AuthCubit>()
                                .loginPhoneNoController,
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
                          BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                            if (state is VerifySuccess) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyOtpScreen()));
                            }
                          }, builder: (context, state) {
                            if (state is AuthLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Center(
                              child: MyButton1(
                                  buttonText: "Send OTP",
                                  buttonPressed: () {
                                    final bool val = context
                                        .read<AuthCubit>()
                                        .loginPhnoNoKey
                                        .currentState!
                                        .validate();
                                    if (val) {
                                      context.read<AuthCubit>().verifyPhoneNo(
                                          phoneNo: int.parse(context
                                              .read<AuthCubit>()
                                              .loginPhoneNoController
                                              .text),
                                          context: context);
                                    } else {
                                      return;
                                    }
                                  }),
                            );
                          }),
                          TextWithLink(
                              buttonFunction: const AdminSignInScreen(),
                              navContext: context,
                              bottomText: "Sign in with Email?",
                              linkText: "Sign in"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
