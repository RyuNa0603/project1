import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/cubits_&_states/cubits/password_visbility_cubit.dart';

class MyAccount extends StatelessWidget {
  MyAccount({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocProvider(
        create: (_) => PasswordVisibilityCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 23, 135, 27),
              ),
              const SizedBox(height: 8),
              Text(
                "Change Picture",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.primary500,
                ),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Password
              BlocBuilder<PasswordVisibilityCubit, bool>(
                builder: (context, isVisible) {
                  return TextField(
                    controller: passwordController,
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () {
                          context
                              .read<PasswordVisibilityCubit>()
                              .toggleVisibility();
                        },
                        child: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: ColorsApp.primary500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorsApp.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
