part of '../home_screen.dart';

class _SideBarItem {
  final String title;
  final IconData icon;
  final void Function() _onTap;
  final bool isSelected;

  _SideBarItem({
    required this.title,
    required this.icon,
    required void Function() onTap,
    required BuildContext context,
  }) : isSelected =
           GoRouter.of(
             context,
           ).state.path?.contains(title.toLowerCase()) ??
           false,
       _onTap = onTap;

  void onTap() {
    if (isSelected) return;
    _onTap();
  }
}

class _SideBar extends StatelessWidget {
  const _SideBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          Align(alignment: Alignment.center, child: AppLogo()),
          heightSpace(40),
          ..._sideBarItems(
            context,
          ).map((item) => _SideBarItemWidget(item: item)),
        ],
      ),
    );
  }

  List<_SideBarItem> _sideBarItems(BuildContext context) => [
    // _SideBarItem(
    //   title: 'Dashboard'.tr(context),
    //   icon: AppIcons.dashboard,
    //   onTap: () {},
    //   context: context,
    // ),
    _SideBarItem(
      title: 'Admins'.tr(context),
      icon: AppIcons.person,
      onTap: () => context.to(AdminsNavigator.admins()),
      context: context,
    ),
    _SideBarItem(
      title: 'Teachers'.tr(context),
      icon: AppIcons.person_outline,
      onTap: () => context.to(TeachersNavigator.teachers()),
      context: context,
    ),
    _SideBarItem(
      title: 'Students'.tr(context),
      icon: AppIcons.person,
      onTap: () => context.to(StudentNavigator.students()),
      context: context,
    ),
    _SideBarItem(
      title: 'Parents'.tr(context),
      icon: AppIcons.person,
      onTap: () => context.to(ParentNavigator.parents()),
      context: context,
    ),

    _SideBarItem(
      title: 'Classes'.tr(context),
      icon: AppIcons.class_icon,
      onTap: () => context.to(SchoolClassNavigator.classes()),
      context: context,
    ),

    _SideBarItem(
      title: 'Absences'.tr(context),
      icon: AppIcons.cached,
      onTap: () => context.to(AbsenceNavigator.absences()),
      context: context,
    ),

    _SideBarItem(
      title: 'Tuition Fees'.tr(context),
      icon: AppIcons.payment,
      onTap: () => context.to(PaymentNavigator.tuitionFees()),
      context: context,
    ),
  ];
}

class _SideBarItemWidget extends StatefulWidget {
  final _SideBarItem item;

  const _SideBarItemWidget({required this.item});

  @override
  State<_SideBarItemWidget> createState() =>
      _SideBarItemWidgetState();
}

class _SideBarItemWidgetState extends State<_SideBarItemWidget> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final color =
        isHovering
            ? AppColors.primaryLight
            : widget.item.isSelected
            ? AppColors.primary
            : AppColors.blackLight;

    return Builder(
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 8.w,
          ),

          child: InkWell(
            onHover: (value) {
              setState(() => isHovering = value);
            },

            onTap: widget.item.onTap,
            child: Row(
              children: [
                Icon(widget.item.icon, color: color, size: 32.r),
                widthSpace(12),
                Text(
                  widget.item.title,
                  style: AppTextStyles.xLarge.copyWith(color: color),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
