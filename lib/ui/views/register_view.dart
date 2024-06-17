import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 100,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 370,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
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
                  obscureText: true,
                  decoration: CustomInputs().buildLoginInputDecoration(
                    icon: Icons.email_outlined,
                    hint: 'Ingrese su contraseña',
                    label: 'Contraseña',
                  ),
                ),

                const SizedBox(height: 20),

                CustomOutlinedButton(
                  onPressed: () {},
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
  }
}
