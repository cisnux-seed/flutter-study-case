// abscract class for check Aspect Ratio Axis
abstract class Ratio {
  /// This static method used for checked aspect horizontal ratio by index
  static int getCrossRatio(int index) {
    /// if index is eqaul to 1 or index is equal to 2, then return 1
    if ((index + 1) == 1 || (index + 1) == 2)
      return 1;

    /// if index is eqaul to 3, then return 2
    else if ((index + 1) == 3)
      return 2;

    /// if index is not eqaul to 1 or index is not equal to 2
    /// but index is equal to 8, then return 2
    else if (((index + 1) != 1 || (index + 1) != 2) && (index + 1) % 8 == 0)
      return 2;

    /// default ratio is 1
    return 1;
  }

  /// This static method used for checked aspect vertical ratio by index
  static double getMainRatio(int index) {
    /// if index is equal to or index is equal to 2, then return 1
    if ((((index + 1) == 1) || ((index + 1) == 2)))
      return 1.0;

    /// if index is not equal to or index is not equal to 2,
    /// but index is odd number then return 1
    else if (((index + 1) != 1 && (index + 1) != 2) && (index + 1).isOdd)
      return 1.0;

    /// if index is not equal to or index is not equal to 2,
    /// but index is even number and index is not multiple of 8, then return 2
    else if (((index + 1) != 1 && (index + 1) != 2) &&
        (index + 1).isEven &&
        ((index + 1) % 8 != 0))
      return 2.0;

    /// if index is not equal to or index is not equal to 2,
    /// but index is even number and index is multiple of 8, then return 1
    else if ((((index + 1) != 1 && (index + 1) != 2) && (index + 1).isEven) &&
        ((index + 1) % 8 == 0)) return 1.0;

    /// default ratio is 1.0
    return 1.0;
  }
}
