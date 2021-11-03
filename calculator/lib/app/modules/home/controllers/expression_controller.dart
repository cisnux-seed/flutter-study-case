import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class ExpressionController extends GetxController {
  final _expressions = Rx<String>('');
  final _result = Rx<String>('0');

  String get result => _result.value;
  set result(result) => _result.value = result;
  String get expressions => _expressions.value;
  set expressions(expressions) => _expressions.value = expressions;

  void inputExpression(String expression) {
    if (expression == 'clear') {
      expressions = (expressions.isNotEmpty)
          ? expressions.substring(0, expressions.length - 1)
          : '0';
    } else if (expression == 'all clear') {
      expressions = '';
      result = '0';
    } else {
      expressions += expression;
    }
  }

  void getResult() {
    if (expressions.isNotEmpty) {
      try {
        var parser = Parser();
        var changeExpressionToMath = expressions.replaceAll('%', '/100');
        var exp = parser.parse(changeExpressionToMath.replaceAll('x', '*'));
        double expResult = exp.evaluate(EvaluationType.REAL, ContextModel());
        result =
            ((expResult % 1 == 0) ? expResult.toInt() : expResult).toString();
        throw FormatException('User doesn\'t input operand two');
      } catch (error) {
        print(error);
      }
    } else
      expressions = '';
  }
}
