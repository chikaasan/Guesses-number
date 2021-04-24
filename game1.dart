
import 'dart:io';
import 'dart:math';

class Game
{
  static int min = 0;
  static int max = 100;
  int step = 1;
  
  int? comp; 
  int step1 = 1;

  int winn = 0;
  int lose = 0;
  int draw = 0;
  
  int binarySearch(min, max) 
  {
    int stepOf = 0;
    int mid = ((max + min) / 2).floor();
    print("Вы загадали это число? $mid \n1 - Да\n2 - Нет");
    String answer = stdin.readLineSync()!;
    if (answer == "1") 
    {
      print('Ваше число - $mid');
      print("$step шагов");
    }
    else if(answer == "2")
    {
      print("Твое число больше(1) или меньше(2)");
      String comparson = stdin.readLineSync()!;
      if (comparson == "1")
      {
        min = mid + 1;
        step++;
        print("??????????????????????? $step");
        binarySearch(min, max);
      } 
      else if(comparson == "2")
      {
        step++;
        max = mid - 1;
        binarySearch(min, max);
      }
      else 
      {
        print("Некорректные данные");
      }
    }
    else 
    {
      print("Некорректные данные");
    }
    stepOf = step;
    return stepOf;
  }

  randomSearch(min, max)
{
  int stepOf = 0;
  print('мин $min');
  print('макс $max');
  int mid = new Random().nextInt(max - min);
  print("Вы загадали это число? $mid \n1 - Да \n2 - Нет");
  String answer = stdin.readLineSync()!;
  if (answer == "1") 
  {
    print('Ваше число - $mid');
    print("$step шагов");
  }
    else if(answer == "2")
    {
      print("Ваше число больше(1) или меньше(2)");
      String comparson = stdin.readLineSync()!;
      if (comparson == "1")
      {
        step++;
        randomSearch(mid + 1, max);
      } 
      else if(comparson == "2")
      {
        step++;
        randomSearch(min, mid - 1);
      }
      else 
      {
        print("Некорректные данные");
      }
    }
    else 
    {
      print("Некорректные данные");
    } 
    stepOf = step;
    return stepOf;
  }




  computer(comp, step1)
  {
    int stepOf3;
    print("Отгадайте число от 1 до 100");
    
    String kill = stdin.readLineSync()!;
    int myNumber = int.parse(kill);
    if(comp == myNumber)
    {
      print("Ты выиграл");
      print("$step1 шагов");
      
    }
    else if(comp > myNumber)
    {
      step1++;
      print("Меньше чем надо");
      return computer(comp, step1);
    }
    else 
    {
      step1++;
      print("Больше чем надо");
      return computer(comp, step1);
    }
    stepOf3 = step1;
    return stepOf3;
  }
  

  competition()
  {
    print("Сколько раундов хотите сыграть? ");
    String round = stdin.readLineSync()!;
    if(round == "")
    {
      print("Стандартное количесво раундов 3");
      round = "3";
      int rounds = int.parse(round);
      for(int i = 1; i < rounds; i++)
      {
        int will = binarySearch(0, 100);
        int comp = new Random().nextInt(100);
        int kill = computer(comp, 1);
        if(will > kill) 
        {
          print("Ты победил в раунде. Счет $will : $kill");
        }
        else if(will < kill)
        {
          print("Ты проиграл в раунде. Счет $will : $kill");
        }
        else 
        {
          print("Ничья в раунде. Счет $will : $kill");
        }
        print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
      }
    }
    int rounds = int.parse(round);
    for(int i = 1; i < rounds; i++)
    {
      int will = binarySearch(0, 100);
      
      int comp = new Random().nextInt(100);
      int kill = computer(comp, 1);
      if(will > kill) 
      {
        winn++;
        print("Ты победил в раунде. Счет $will : $kill");
      }
      else if(will < kill)
      {
        lose++;
        print("Ты проиграл в раунде. Счет $will : $kill");
      }
      else 
      {
        print("Ничья в раунде. Счет $will : $kill");
      }
      print("||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    }
    if(winn < lose)
    {
      print("Ты проиграл");
    }
    else if(winn > lose)
    {
      print("Ты выиграл");
    }
    else 
    {
      print("Ничья");
    }

      
  }
}

main() 
{
  print("\t\t\t\t\t\t\t\t Меню\n\t\tВыберите режим игры \n1 - Вы загадываете число\n2 - Вы отгадываете число\n3 - Соревнование(кто быстрее отгадает)");
  String a = stdin.readLineSync()!;
  if(a == "1")
  {
    print("Выберите уровень сложности \n1 - Легкий \n2 - Сложный");
    String a = stdin.readLineSync()!;
    if(a == "1")
    {
      var first = new Game();
      first.randomSearch(0, 100);
    }
    else
    {
      var first = new Game();
      first.binarySearch(0, 100);
    }
  }
  else if(a == "2")
  {
    int randomm = new Random().nextInt(100);
    var first = new Game();
    first.computer(randomm, 1);
  }
  else 
  {
    var first = new Game();
    first.competition();
  }
}