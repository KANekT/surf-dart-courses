import 'package:decimal/decimal.dart';

import 'amount.dart';
import 'category_type.dart';

/// Модель продукта.
///
/// Содержит в себе название, цену, категорию и ссылку на изображение.
class ProductEntity {
  /// Название товара.
  final String title;

  /// Цена товара в копейках. Без скидки.
  ///
  /// Подумайте и ответьте на три вопроса:
  /// 1. Почему цена хранится в копейках, а не в рублях?
  /// 2. Почему тип данных цены - [int], а не [double]?
  /// 3. Как можно было реализовать передачу цены иначе?
  ///
  /// Ответы на вопросы разместите тут (они будут проверены при код-ревью):
  ///
  /// [ОТВЕТЫ]
  /// 1 Для денег важны "копейки". Потеря любой значащей цифры в финансовой сфере недопустима.
  /// 2 double a = 2.00 - 1.10 a ==> 0.8999999999999999
  /// 3 в виде строки / сделать 2 переменные для целого числа рублей и копеек
  final int price;

  /// Категория товара.
  final Category category;

  /// Ссылка на изображение товара.
  final String imageUrl;

  /// Количество товара.
  ///
  /// Может быть описано в граммах [Grams] или в штуках [Quantity].
  final Amount amount;

  /// Скидка на товар.
  ///
  /// Требуется высчитать самостоятельно итоговую цену товара.
  final double sale;

  Decimal get decimalPrice => _getDecimalPrice(price);
  Decimal get decimalSale => _getDecimalSale(sale);

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });

  // Переведем цену в формат decimal для точных расчетов
  _getDecimalPrice(int price) {
    final priceStr = (price / 100).toStringAsFixed(2);
    return Decimal.parse(priceStr);
  }

  // Переведем цену в формат decimal для точных расчетов
  _getDecimalSale(double sale) {
    final priceStr = sale.toStringAsFixed(2);
    return Decimal.parse(priceStr);
  }
}