part of '../home_screen.dart';

class _SideBarItem {
  final String title;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;

  _SideBarItem({
    required this.title,
    required this.icon,
    required this.onTap,
    required BuildContext context,
  }) : isSelected =
           GoRouter.of(context).state.name == title.toUpperCase();
}

class _SideBar extends StatelessWidget {
  _SideBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          AppLogo(),
          heightSpace(40),
          ..._sideBarItems(
            context,
          ).map((item) => _SideBarItemWidget(item: item)),
        ],
      ),
    );
  }

  List<_SideBarItem> _sideBarItems(BuildContext context) => [
    _SideBarItem(
      title: 'Dashboard',
      icon: AppIcons.dashboard,
      onTap: () {},
      context: context,
    ),
  ];
}

class _SideBarItemWidget extends StatelessWidget {
  final _SideBarItem item;

  const _SideBarItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final color =
        item.isSelected ? AppColors.primary : AppColors.greyDark;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: InkWell(
        onTap: item.onTap,
        child: Row(
          children: [
            Icon(item.icon, color: color, size: 32.r),
            widthSpace(12),
            Text(
              item.title,
              style: AppTextStyles.xLarge.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
