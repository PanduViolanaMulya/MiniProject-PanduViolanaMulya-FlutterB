import 'package:flutter/material.dart';

class ShopModel {
  final IconData shopIcon;
  final String shopItem;
  final int shopPrice;
  final String shopDescription;
  bool isBought;

  ShopModel(
      {required this.shopIcon,
      required this.shopItem,
      required this.shopPrice,
      required this.shopDescription,
      required this.isBought});
}

List<ShopModel> shop = [
  ShopModel(
      shopIcon: Icons.card_giftcard,
      shopItem: 'Discount Card',
      shopPrice: 300,
      shopDescription: 'Decrease Shop Item Price by 200',
      isBought: false),
  ShopModel(
      shopIcon: Icons.lock_open,
      shopItem: 'Level Card',
      shopPrice: 550,
      shopDescription: 'Unlock 1 level without waiting for cooldown',
      isBought: false),
  ShopModel(
      shopIcon: Icons.brightness_medium,
      shopItem: 'Dark Theme Changer',
      shopPrice: 300,
      shopDescription: 'Change Your Theme into Dark',
      isBought: false),
];
