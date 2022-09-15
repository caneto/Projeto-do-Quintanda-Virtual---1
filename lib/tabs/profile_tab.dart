import 'package:flutter/material.dart';
import 'package:quitandavirtual/components/custom_text_field.dart';
import 'package:quitandavirtual/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
          ),
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
          ),
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
        ],
      ),
    );
  }
}
