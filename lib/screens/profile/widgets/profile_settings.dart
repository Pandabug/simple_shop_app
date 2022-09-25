import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/auth/auth_bloc.dart';

import 'package:simple_shop_app/screens/cart/cart_screen.dart';
import 'package:simple_shop_app/screens/profile/secondary%20pages/add_product.dart';
import 'package:simple_shop_app/screens/profile/secondary%20pages/notifications_screen.dart';
import 'package:simple_shop_app/screens/profile/secondary%20pages/personal_information.dart';
import 'package:simple_shop_app/screens/profile/widgets/card_item_profile.dart';
import 'package:simple_shop_app/screens/profile/widgets/divider_line.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSettingsTitle(name: 'Common'),
        CardItemProfile(
          text: 'Personal Information',
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          icon: Icons.person_outline_rounded,
          backgroundColor: const Color(0xff7882ff),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PersonalInformationScreen(),
              ),
            );
          },
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'Credit Card',
          borderRadius: BorderRadius.zero,
          icon: Icons.credit_card_rounded,
          backgroundColor: const Color(0xffFFCD3A),
          onPressed: () {},
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'Add Product',
          borderRadius: BorderRadius.zero,
          icon: Icons.add,
          backgroundColor: const Color(0xff02406F),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductScreen(),
              ),
            );
          },
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'User Products List',
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          icon: Icons.format_list_numbered,
          backgroundColor: const Color.fromARGB(255, 111, 67, 2),
          onPressed: () {},
        ),
        const ProfileSettingsTitle(name: 'General'),
        CardItemProfile(
          text: 'Settings',
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          backgroundColor: const Color(0xff2EAA9B),
          icon: Icons.settings_applications,
          onPressed: () {},
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'Notifications',
          borderRadius: BorderRadius.zero,
          backgroundColor: const Color(0xffE87092),
          icon: Icons.notifications_none_rounded,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationsScreen(),
            ),
          ),
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'My Cart',
          backgroundColor: const Color(0xff0716A5),
          icon: Icons.shopping_bag_outlined,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          },
        ),
        const ProfileSettingsTitle(name: 'Personal'),
        CardItemProfile(
          text: 'Privacy & Policy',
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          backgroundColor: const Color(0xff6dbd63),
          icon: Icons.policy_rounded,
          onPressed: () {},
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'Security',
          borderRadius: BorderRadius.zero,
          backgroundColor: const Color(0xff1F252C),
          icon: Icons.lock_outline_rounded,
          onPressed: () {},
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'Term & Conditions',
          borderRadius: BorderRadius.zero,
          backgroundColor: const Color(0xff458bff),
          icon: Icons.description_outlined,
          onPressed: () {},
        ),
        DividerLine(size: size),
        CardItemProfile(
          text: 'Help',
          backgroundColor: const Color(0xff4772e6),
          icon: Icons.help_outline,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          onPressed: () {},
        ),
        const ProfileSettingsTitle(name: 'Sign Out'),
        CardItemProfile(
          text: 'Sign Out',
          borderRadius: BorderRadius.circular(30),
          icon: Icons.power_settings_new_sharp,
          backgroundColor: Colors.red,
          onPressed: () {
            authBloc.add(
              LogOutEvent(),
            );
          },
        ),
      ],
    );
  }
}

class ProfileSettingsTitle extends StatelessWidget {
  const ProfileSettingsTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        top: 15,
        bottom: 10,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      ),
    );
  }
}
