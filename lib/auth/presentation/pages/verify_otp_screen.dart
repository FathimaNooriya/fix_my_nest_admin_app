import 'package:fix_my_nest_admin_app/auth/presentation/widgets/my_button1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../core/color_and_fond.dart';
import '../../../core/padding.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../widgets/tittle.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Tittles(tittle: "Verify OTP"),
                  Center(
                    child: Text(
                      "Enter the 6 digit one time password, which is send to your registered mobile number",
                      style: ColorAndFont.Normal_TEXT,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpTextField(
                        numberOfFields: 6,
                        borderColor: ColorAndFont.GREEN,
                        showFieldAsBox: true,
                        onSubmit: (String OTPcode) {
                          print(OTPcode);
                          context
                              .read<AuthCubit>()
                              .changeOtpValue(otpCode: OTPcode);
                          context.read<AuthCubit>().verifyOtp(
                              otpCode: OTPcode,
                              context: context,
                              verificationId: context
                                  .read<AuthCubit>()
                                  .phoneVerificationId);
                        },
                      ),
                    ],
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                    if (state is VerifySuccess) {
                      print("veryfy success");
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Verified OTP")));
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const HomeScreen()));
                    } else if (state is VerifyFailed) {
                      print("veryfy failed");
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("OTP Failed")));
                    }
                  }, builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return MyButton1(
                      buttonText: "Verify OTP",
                      buttonPressed: () {
                        context.read<AuthCubit>().verifyOtp(
                            verificationId:
                                context.read<AuthCubit>().phoneVerificationId,
                            otpCode: context.read<AuthCubit>().otpValue,
                            context: context);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpTextfield1 extends StatelessWidget {
  const OtpTextfield1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: SizedBox(
        height: 60,
        width: 45,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 2,
                color: ColorAndFont.GREEN,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
