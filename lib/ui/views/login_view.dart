import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) => loginFormProvider.email = value,
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no válido.';
                        }
                        return null;
                      },
                      decoration: CustomInputs().buildLoginInputDecoration(
                        icon: Icons.email_outlined,
                        hint: 'Ingrese su correo',
                        label: 'Email',
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) => loginFormProvider.password = value,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su contraseña.';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe de ser de 6 caracteres.';
                        }
                        return null;
                      },
                      decoration: CustomInputs().buildLoginInputDecoration(
                        icon: Icons.email_outlined,
                        hint: 'Ingrese su contraseña',
                        label: 'Contraseña',
                      ),
                    ),

                    const SizedBox(height: 20),

                    CustomOutlinedButton(
                      onPressed: () {
                        if (loginFormProvider.validateForm()) {
                          authProvider.login(loginFormProvider.email,
                              loginFormProvider.password);
                        }
                      },
                      label: 'Ingresar',
                      // isFilled: true,
                    ),

                    const SizedBox(height: 20),

                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.registerRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
