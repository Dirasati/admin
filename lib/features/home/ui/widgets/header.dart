part of '../home_screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            //TODO show notifications
          },
          child: Icon(AppIcons.notifications),
        ),

        widthSpace(16),

        InkWell(
          onTap: () {
            //TODO show profile
          },
          child: CircleAvatar(
            radius: 32.r,
            //TODO add user image
          ),
        ),
      ],
    );
  }
}
