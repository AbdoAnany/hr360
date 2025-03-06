import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/1_login/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:hr360/features/1_login/presentation/page/signup.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/constants/keys.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/utils/local_storage/storage_utility.dart';
import '../../../../di.dart';
import '../../../../main.dart';
import '../../../main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController =
      TextEditingController(text: 'admin2');
  final TextEditingController _passwordController =
      TextEditingController(text: "password123");
  late bool rememberMe = false;
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
  }

  _obscureTextChange() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _navigateToSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  Future<void> _setRememberMe(bool? value) async {
    await getIt<TLocalStorage>()
        .saveData<bool?>(AppKeys.rememberMe, value)
        .then((e) {
      rememberMe = value ?? false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
          body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(CustomPopUp.errorSnackBar(state.errMessage!));
        }  else if (state is AuthSuccess) {
          AppRouter().navigateWithTransition(context, AppRoutes.dashboard);

        }
      }, builder: (context, s) {
        AuthCubit authCubit = AuthCubit.get(context);
        return Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildTextField(
                    controller: _usernameController,
                    label: 'Username',
                    icon: Iconsax.security_user,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter username' : null,
                  ),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Password',
                    icon: Iconsax.lock,
                    obscureChange: () => _obscureTextChange(),
                    obscureText: _obscureText,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter password' : null,
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) => _setRememberMe(value!),
                        ),
                        const Text(
                          'Remember Me',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  MaterialButton(
                      color: AppColor.primary,
                      height: 56,
                      minWidth: 350,
                      shape: RoundedRectangleBorder(
                          borderRadius: AppStyle.borderRadius15),
                      child: const Text(
                        'Login ',
                        style: TextStyle(color: AppColor.white),
                      ),
                      onPressed: ()=>  authCubit.login(
                        password: _passwordController.text,
                        email: _usernameController.text,
                        formKey: _formKey,
                        // context: context
                      )),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: _navigateToSignUp,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                            color: AppColor.textPrimary, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'create new account',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 16,
                              //  fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      })),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    double? width = 350,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
    void Function()? obscureChange,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          // suffixIcon:  IconButton(
          //     onPressed: obscureChange,
          //     icon: obscureChange==null?null:Icon(obscureText?Icons.remove_red_eye:Icons.panorama_fish_eye)),
          enabledBorder: OutlineInputBorder(
              borderRadius: AppStyle.borderRadius15,
              borderSide: BorderSide(color: Colors.black.withOpacity(.2))),
          focusedBorder: OutlineInputBorder(
              borderRadius: AppStyle.borderRadius15,
              borderSide: BorderSide(color: Colors.black.withOpacity(.2))),
          border: OutlineInputBorder(
              borderRadius: AppStyle.borderRadius15,
              borderSide: BorderSide(color: Colors.black.withOpacity(.2))),
        ),
        validator: validator,
      ),
    );
  }
}

class CustomPopUp {
  static SnackBar errorSnackBar(String message) => SnackBar(
        content: Text(
          message,
          style: TextStyle(fontFamily: "Outfit"),
        ),
        backgroundColor: Colors.red,
      );
}
