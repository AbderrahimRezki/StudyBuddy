import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class NavigationBarItemEntity extends Equatable {
  final String itemTitle;
  final String iconPath;
  final String route;

  const NavigationBarItemEntity({
    required this.itemTitle,
    required this.iconPath,
    required this.route,
  });

  @override
  List<Object> get props => [itemTitle, iconPath];
}
