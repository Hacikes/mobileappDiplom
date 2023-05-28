import 'package:flutter/material.dart';

class ColorsClass {
  ColorsClass();

  static List<Color> colors = [
    Colors.green[500]!,
    Colors.red[400]!,
    Colors.blue[500]!,
    Colors.green[300]!,
    Colors.yellow[500]!,
    Colors.pink[500]!,
    Colors.cyanAccent,
    Colors.orangeAccent,
    Colors.red[100]!,
    // Добавьте другие цвета, если необходимо
  ];

  static Color background_for_srceen = Colors.black38;
  static Color background_for_appbar = Colors.black54;
  static Color background_for_not_pressed_button = Colors.blue;
  static Color background_for_pressed_button = Colors.grey;
  static Color background_for_header_drawer = Colors.grey[800]!;
  static Color background_for_body_drawer = Colors.grey[900]!;



  static Color front_for_not_pressed_button = Colors.white;
  static Color front_for_pressed_button = Colors.white;
  static Color front_for_header_text = Colors.white;
  static Color front_for_graph_text = Colors.white;
  static Color front_for_pop_up_messages = Colors.white;
  static Color front_for_hint_on_field = Colors.grey[200]!;


  static Color border_decoration_color = Colors.blue;


  static Color pouring_for_icon = Colors.white;



  // Список цветов для графиков
  static List<Color> getColors() {
    return colors;
  }
  // Для общего фона экранов
  static Color getBackgroundForSrceen(){
    return background_for_srceen;
  }
  // Для фона Appbar
  static Color getBackgroundForAppbar(){
    return background_for_appbar;
  }
  // Для фона ненажатых кнопок
  static Color getBackgroundForNotPressedButton(){
    return background_for_not_pressed_button;
  }
  // Для фона нажатых кнопок
  static Color getBackgroundForPressedButton(){
    return background_for_pressed_button;
  }
  // Для фона хедера выдвижной панели слева
  static Color getBackgroundForHeaderDrawer(){
    return background_for_header_drawer;
  }
  // Для фона тела выдвижной панели слева
  static Color getBackgroundForBodyDrawer(){
    return background_for_body_drawer;
  }


  // Для текста в не нажатых кнопках
  static Color getFrontForNotPressedButton(){
    return front_for_not_pressed_button;
  }
  // Для текста в нажатых кнопках
  static Color getFrontForPressedButton(){
    return front_for_pressed_button;
  }
  // Для заголовков
  static Color getFrontForHeaderText(){
    return front_for_header_text;
  }
  // Для текста графика и того, что из него выводится
  static Color getFrontForGraphText(){
    return front_for_graph_text;
  }
  // Для текста всплывашек
  static Color getFrontForPopUpMessages(){
    return front_for_pop_up_messages;
  }
  // Для текста всплывашек
  static Color getFrontForHintOnField(){
    return front_for_hint_on_field;
  }


  // Для подсветки активного поля
  static Color getBorderDecorationColor(){
    return border_decoration_color;
  }


  // Для подсветки активного поля
  static Color getPouringForIcon(){
    return pouring_for_icon;
  }

}