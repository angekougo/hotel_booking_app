import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/config/app_style.dart';
import 'package:hotel_booking_app/config/constants/app_breakpoints.dart';
import 'package:hotel_booking_app/config/utils/context_utils.dart';
import 'package:hotel_booking_app/widgets/custom_text_form_field.dart';

import '../config/constants/app_dimensions.dart';
import '../config/constants/app_strings.dart';
import '../widgets/form_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              constraints: BoxConstraints(maxWidth: AppBreakpoints.maxFormWidth),
              child: Column(
                children: [
                  FormTitle(
                      title: AppStrings.signupTitle,
                      subTitle: AppStrings.signupSubtitle),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _lastnameController,
                          labelText: AppStrings.inputTextLastName,
                          prefixIcon: Icons.person,
                          prefixIconColor: context.primaryColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le nom est requis';
                            }
                            return null; // null = valide !
                          },
                        ),
                        CustomTextFormField(
                          controller: _firstnameController,
                          labelText: AppStrings.inputTextFirstName,
                          prefixIcon: Icons.person_outline,
                          prefixIconColor: context.primaryColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Un prénom est requis';
                            }
                            return null; // null = valide !
                          },
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          labelText: AppStrings.inputTextEmail,
                          prefixIcon: Icons.email,
                          prefixIconColor: context.primaryColor,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email requis';
                            }
                            if (!value.contains('@')) {
                              return 'Format email invalide';
                            }
                            return null; // null = valide !
                          },
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          labelText: AppStrings.inputTextPassword,
                          prefixIcon: Icons.lock,
                          prefixIconColor: context.primaryColor,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mot de passe requis';
                            }
                            if (value.length < 8) return 'Minimum 8 caractères';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: AppDimensions.spaceLarge,
                        ),
                        FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.go('/'); // Appelle tous les onSaved
                              if (kDebugMode) {
                                print('Email: $_email, Password: $_password');
                              }
                            }
                          },
                          child: Text(
                            AppStrings.signupButton,
                            style: AppStyle.textButtonPrimary(context),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
