import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class NavigationBarItemEntity extends Equatable {
  final String itemTitle;
  final String iconPath;

  const NavigationBarItemEntity({
    required this.itemTitle,
    required this.iconPath,
  });

  @override
  List<Object> get props => [itemTitle, iconPath];
}
