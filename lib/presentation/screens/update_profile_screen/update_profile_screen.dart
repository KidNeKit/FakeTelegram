import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../global_components/custom_text_button.dart';
import 'components/settings_container.dart';
import 'components/settings_text.dart';
import 'components/settings_text_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const String routeName = '/update-profile';

  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: navBarColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 10.0, bottom: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      onTap: () => Navigator.of(context).pop(),
                      text: 'Отмена',
                    ),
                    CustomTextButton(
                      onTap: () => Navigator.of(context).pop(),
                      text: 'Готово',
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: size.width / 8,
                ),
                const SizedBox(height: 10.0),
                Text('Выбрать фотографию', style: blueHeaderButton),
                const SizedBox(height: 10.0),
                const SettingsContainer(
                  children: [
                    SettingsTextField(hintText: 'Имя'),
                    SettingsTextField(hintText: 'Фамилия'),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Укажите имя и, если хотите, добавьте фотографию для Вашего профиля.',
                    textAlign: TextAlign.start,
                    style: chatGreyInfoStyle,
                  ),
                ),
                const SizedBox(height: 30.0),
                const SettingsContainer(
                  children: [
                    SettingsTextField(hintText: 'О себе'),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Любые подробности, например: возраст, род занятий или город.\nПример: 23 года, дизайнер из Санкт-Петербурга.',
                    textAlign: TextAlign.start,
                    style: chatGreyInfoStyle,
                  ),
                ),
                const SizedBox(height: 30.0),
                SettingsContainer(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SettingsText('Сменить номер'),
                        SettingsText('+375 XX XXX XX XX', color: greyInfoColor),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SettingsText('Имя пользователя'),
                        SettingsText('@KidNeKit', color: greyInfoColor),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                const SettingsContainer(
                  children: [
                    SettingsText(
                      'Выйти',
                      textAlign: TextAlign.center,
                      color: Colors.red,
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Route getMaterialPageRoute() =>
      MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
}
