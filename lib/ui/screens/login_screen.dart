import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/config/app_style.dart';
import 'package:hotel_booking_app/config/constants/app_breakpoints.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';
import 'package:hotel_booking_app/config/constants/app_strings.dart';
import 'package:hotel_booking_app/config/utils/context_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceLarge,
                vertical: AppDimensions.spaceExtraLarge,
              ),
              constraints:
                  BoxConstraints(maxWidth: AppBreakpoints.maxFormWidth),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      AppStrings.loginTitle,
                      style: AppStyle.display(context),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.loginSubtitle,
                      style: AppStyle.subtitle(context),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.spaceExtraLarge,
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        // Email TextFormField
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: AppStrings.inputTextEmail,
                            prefixIcon: Icon(
                              Icons.email,
                              color: context.primaryColor,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.errorEmailRequired;
                            }
                            if (!value.contains('@')) {
                              return AppStrings.errorEmailInvalid;
                            }
                            return null; // null = valide !
                          },
                          onSaved: (value) => _email = value,
                        ),
                        SizedBox(
                          height: AppDimensions.spaceLarge,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: AppStrings.inputTextPassword,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: context.primaryColor,
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mot de passe requis';
                            }
                            if (value.length < 8) return 'Minimum 8 caractères';
                            return null;
                          },
                          onSaved: (value) => _password = value,
                        ),
                        SizedBox(
                          height: AppDimensions.spaceMedium,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(AppStrings.forgotPassword),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.spaceLarge,
                        ),
                        FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.go('/main'); // Appelle tous les onSaved
                              if (kDebugMode) {
                                print('Email: $_email, Password: $_password');
                              }
                            }
                          },
                          child: Text(
                            AppStrings.loginButton,
                            style: TextStyle(
                                fontSize: AppDimensions.fontBodyLarge),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.spaceLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.askSignup),
                      TextButton(
                        onPressed: () => context.push('/signup'),
                        child: Text(
                          AppStrings.actionSignup,
                          style: AppStyle.bodyPrimary(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
