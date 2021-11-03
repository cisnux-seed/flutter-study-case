import 'package:calculator/app/modules/home/controllers/expression_controller.dart';
import 'package:calculator/app/modules/home/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/calculator_button.dart';
import 'package:get/get.dart';

class HomeView extends GetView<ThemeController> {
  @override
  Widget build(BuildContext context) {
    final expressionController = Get.find<ExpressionController>();
    var height = context.height -
        context.mediaQuery.padding.top -
        context.mediaQuery.padding.bottom;
    var width = context.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Container(
                  height: height * 0.35,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 20.0),
                      Obx(
                        () => Text(
                          '${expressionController.result}',
                          style: TextStyle(fontSize: 70.0),
                          textAlign: TextAlign.end,
                          maxLines: 1,
                        ),
                      ),
                      Obx(
                        () => Text(
                          '${expressionController.expressions}',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 30.0,
                            color: context.theme.accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.60,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '^',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('^'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            'C',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('clear'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            'AC',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('all clear'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          child: Icon(
                            Icons.color_lens_outlined,
                            color: context.theme.primaryColor,
                            size: 28.0,
                          ),
                          onTap: () => controller.changeTheme(
                            Get.isDarkMode
                                ? ThemeStatus.light
                                : ThemeStatus.dark,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '(',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('('),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '%',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('%'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            ')',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression(')'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          child: Text(
                            '/',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () =>
                              expressionController.inputExpression('/'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '7',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('7'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '8',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('8'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '9',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('9'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          child: Text(
                            'x',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () =>
                              expressionController.inputExpression('x'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('4'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '5',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('5'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '6',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('6'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          child: Text(
                            '-',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () =>
                              expressionController.inputExpression('-'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('1'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('2'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('3'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('+'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('0'),
                        ),
                        CalculatorButton(
                          color: context.theme.canvasColor,
                          child: Text(
                            '.',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.17,
                          onTap: () =>
                              expressionController.inputExpression('.'),
                        ),
                        CalculatorButton(
                          color: context.theme.primaryColor,
                          child: Text(
                            '=',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          heightButton: height * 0.084,
                          widthButton: width * 0.415,
                          onTap: () => expressionController.getResult(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
