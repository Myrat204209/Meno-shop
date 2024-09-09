import 'package:app_ui/app_ui.dart';

const advantagesSvg = Assets.advantages;
final kAdvantagesJsonBody = <String, dynamic>{
  'ru': {
    "fastDelivery": advantagesSvg.ru.fastDelivery,
    "freeDelivery": advantagesSvg.ru.freeDelivery,
    "oneToOne": advantagesSvg.ru.oneToOne,
    "twoToOne": advantagesSvg.ru.twoToOne,
    // "oneToGift": advantagesSvg.ru.oneToGift,
    "advantageProduct": {
      '1': advantagesSvg.ru.advantage1,
      '2': advantagesSvg.ru.advantage2,
      '3': advantagesSvg.ru.advantage3,
    },
    "payOnline": advantagesSvg.ru.payOnline,
    // "payTerminal": advantagesSvg.ru,
  },
  'tk': {
    "fastDelivery": advantagesSvg.tk.fastDelivery,
    "freeDelivery": advantagesSvg.tk.freeDelivery,
    "oneToOne": advantagesSvg.tk.oneToOne,
    "twoToOne": advantagesSvg.tk.twoToOne,
    // "oneToGift": advantagesSvg.tk.oneToOne,
    "advantageProduct": {
      '1': advantagesSvg.tk.advantage1,
      '2': advantagesSvg.tk.advantage2,
      '3': advantagesSvg.tk.advantage3,
    },
    "payOnline": advantagesSvg.tk.payOnline,
    // "payTerminal": advantagesSvg,
  },
};
