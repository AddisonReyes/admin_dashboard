import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 35),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) => registerFormProvider.user = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un nombre.';
                        }
                        return null;
                      },
                      decoration: CustomInputs().buildLoginInputDecoration(
                        icon: Icons.supervised_user_circle_sharp,
                        hint: 'Ingrese su nombre',
                        label: 'Nombre',
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Email
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) => registerFormProvider.email = value,
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
                      onChanged: (value) =>
                          registerFormProvider.password = value,
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
                        registerFormProvider.validateForm();
                      },
                      label: 'Crear cuenta',
                      // isFilled: true,
                    ),

                    const SizedBox(height: 20),

                    LinkText(
                      text: 'Iniciar sesion',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
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
