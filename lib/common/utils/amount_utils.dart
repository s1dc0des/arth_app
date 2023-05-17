import 'package:agent_dart/principal/principal.dart';
import 'package:agent_dart/utils/is.dart';
import 'package:intl/intl.dart';

class AmountUtils {
  // BOX has 6 decimals and XTC as 12 decimals

  static const int box_decimals = 6;
  static const int xtc_decimals = 12;
  static const int yc_decimals = 8;
  static const int wicp_decimals = 8;

  static String formatPrincipal({required String principal}) {
    return '${principal.substring(0, 5)}...${principal.substring(principal.length - 3, principal.length)}';
  }

  static String formatAccount({required String account}) {
    return '${account.substring(0, 5)}...${account.substring(account.length - 5, account.length)}';
  }

  static String formatAmount({required int amount, required int decimals}) {
    int d = decimals;
    String amountStr = amount.toString();
    if (amountStr.length > d) {
      String wholePart = amountStr.substring(0, amountStr.length - 8);
      String decimal = amountStr.substring(amountStr.length - 8, amountStr.length).substring(0, 2);
      String value = wholePart
          .split("")
          .reversed
          .join("")
          .replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)},")
          .split("")
          .reversed
          .join("");
      value.split("").first == "," ? value = value.replaceFirst(",", "") : value;
      return "$value.$decimal";
    } else {
      return "0.${'0' * (d - amountStr.length)}$amountStr";
    }
  }

  static String formatWithComma({required int amount}) {
    var formatter = NumberFormat('###,###,000');
    return formatter.format(amount);
  }

  static double multiplyBy10e8({required double amount}) {
    return amount * 100000000;
  }

  static double divideBy10e8({required int amount}) {
    return (amount / 100000000);
  }

  static bool isPrincipal(String? s) {
    if (s == null) return false;
    try {
      Principal.from(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isAccount(String? s) {
    if (s == null) return false;
    return isAccountId(s);
  }

  // testnet address validator
  // static bool isvalidBtcAddress(String a) {
  //   return RegExp(
  //     r"\b(tb(0([ac-hj-np-z02-9]{39}|[ac-hj-np-z02-9]{59})|1[ac-hj-np-z02-9]{8,87})|[mn2][a-km-zA-HJ-NP-Z1-9]{25,39})\b",
  //   )
  //       .hasMatch(a.toLowerCase());
  // }

  // mainnet address validator
  static bool isvalidBtcAddress(String a) {
    return RegExp(
            r"\b(bc(0([ac-hj-np-z02-9]{39}|[ac-hj-np-z02-9]{59})|1[ac-hj-np-z02-9]{8,87})|[13][a-km-zA-HJ-NP-Z1-9]{25,35})\b")
        .hasMatch(a.toLowerCase());
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
