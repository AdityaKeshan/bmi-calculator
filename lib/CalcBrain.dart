import 'dart:math';
class CalcBrain
{
  int height;
  int weight;
  double _bmi;
  CalcBrain({this.height, this.weight});
  String calculateBMI()
  {
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(_bmi>=25)
      {
        return 'OVERWEIGHT';
      }
    else if( _bmi>18.5)
      {
        return 'NORMAL';
      }
    return 'UNDERWEIGHT';
  }
  String getIntepre()
  {
    if(_bmi>=25)
    {
      return 'Excercise a little';
    }
    else if( _bmi>18.5)
    {
      return 'Good job!';
    }
    return 'Eat more';
  }
}