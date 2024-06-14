import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/utils/share_helper.dart';

class HomeController extends GetxController {
  RxList list = ["", "", "", "", "", "", "", "", ""].obs;
  RxInt count = 0.obs;
  RxString win = ''.obs;
  RxInt xScore = 0.obs;
  RxInt oScore = 0.obs;
  RxList emptyIndex = [].obs;

  void getScore() async {
    xScore.value = await ShareHelper.shareHelper.getXScore();
    oScore.value = await ShareHelper.shareHelper.getOScore();
  }

  Future<bool> onWillPop() async {
    bool? result = await Get.defaultDialog(
      title: 'Exit Game',
      middleText: 'Are you sure you want to exit the game?',
      textCancel: 'No',
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      onConfirm: () {
        list.fillRange(0, 9, '');
        Get.back(result: true);
      },
    );
    return result ?? false;
  }

  void resetGame() {
    list.value = List<String>.filled(9, '');
    count.value = 0;
    win.value = '';
  }

  void checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var winn in winPatterns) {
      if (list[winn[0]] != '' &&
          list[winn[0]] == list[winn[1]] &&
          list[winn[1]] == list[winn[2]]) {
        win.value = list[winn[0]];
        if (win.value == 'X') {
          xScore.value++;
          ShareHelper.shareHelper.saveXScore(xScore.value);
          win.value = 'X';
        } else if (win.value == 'O') {
          oScore.value++;
          ShareHelper.shareHelper.saveOScore(oScore.value);
          win.value = 'O';
        }
        break;
      }
    }
    if (!list.contains('')) {
      win.value = 'Draw';
    }
  }

  void botMove() {
    emptyIndex.clear();
    for (int i = 0; i < list.length; i++) {
      if (list[i] == "") {
        emptyIndex.add(i);
      }
    }
    if (emptyIndex.isNotEmpty) {
      int randomIndex = Random().nextInt(emptyIndex.length);
      list[emptyIndex[randomIndex]] = "O";
    }
  }

  void checkBotMove() {
    //012
    if (list[1].contains('X') && list[2].contains('X') && list[0] == '') {
      list[0] = 'O';
    } else if (list[0].contains('X') &&
        list[2].contains('X') &&
        list[1] == '') {
      list[1] = 'O';
    } else if (list[0].contains('X') &&
        list[1].contains('X') &&
        list[2] == '') {
      list[2] = 'O';
    }
    //345
    else if (list[3].contains('X') && list[4].contains('X') && list[5] == '') {
      list[5] = 'O';
    } else if (list[3].contains('X') &&
        list[5].contains('X') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[4].contains('X') &&
        list[5].contains('X') &&
        list[3] == '') {
      list[3] = 'O';
    }
    //678
    else if (list[6].contains('X') && list[7].contains('X') && list[8] == '') {
      list[8] = 'O';
    } else if (list[6].contains('X') &&
        list[8].contains('X') &&
        list[7] == '') {
      list[7] = 'O';
    } else if (list[7].contains('X') &&
        list[8].contains('X') &&
        list[6] == '') {
      list[6] = 'O';
    }
    //036
    else if (list[3].contains('X') && list[6].contains('X') && list[0] == '') {
      list[0] = 'O';
    } else if (list[0].contains('X') &&
        list[6].contains('X') &&
        list[3] == '') {
      list[3] = 'O';
    } else if (list[0].contains('X') &&
        list[3].contains('X') &&
        list[6] == '') {
      list[6] = 'O';
    }
    //147
    else if (list[4].contains('X') && list[7].contains('X') && list[1] == '') {
      list[1] = 'O';
    } else if (list[1].contains('X') &&
        list[7].contains('X') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[1].contains('X') &&
        list[4].contains('X') &&
        list[7] == '') {
      list[7] = 'O';
    }
    //258
    else if (list[5].contains('X') && list[8].contains('X') && list[2] == '') {
      list[2] = 'O';
    } else if (list[2].contains('X') &&
        list[8].contains('X') &&
        list[5] == '') {
      list[5] = 'O';
    } else if (list[2].contains('X') &&
        list[5].contains('X') &&
        list[8] == '') {
      list[8] = 'O';
    }
    //048
    else if (list[4].contains('X') && list[8].contains('X') && list[0] == '') {
      list[0] = 'O';
    } else if (list[0].contains('X') &&
        list[8].contains('X') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[0].contains('X') &&
        list[4].contains('X') &&
        list[8] == '') {
      list[8] = 'O';
    }
    //246
    else if (list[4].contains('X') && list[6].contains('X') && list[2] == '') {
      list[2] = 'O';
    } else if (list[2].contains('X') &&
        list[6].contains('X') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[2].contains('X') &&
        list[4].contains('X') &&
        list[6] == '') {
      list[6] = 'O';
    } else {
      botMove();
    }
  }

  void checkBotWin() {
    //012
    if (list[1].contains('O') && list[2].contains('O') && list[0] == '') {
      list[0] = 'O';
    } else if (list[0].contains('O') &&
        list[2].contains('O') &&
        list[1] == '') {
      list[1] = 'O';
    } else if (list[0].contains('O') &&
        list[1].contains('O') &&
        list[2] == '') {
      list[2] = 'O';
    }
//345
    else if (list[3].contains('O') && list[4].contains('O') && list[5] == '') {
      list[5] = 'O';
    } else if (list[3].contains('O') &&
        list[5].contains('O') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[4].contains('O') &&
        list[5].contains('O') &&
        list[3] == '') {
      list[3] = 'O';
    }
//678
    else if (list[6].contains('O') && list[7].contains('O') && list[8] == '') {
      list[8] = 'O';
    } else if (list[6].contains('O') &&
        list[8].contains('O') &&
        list[7] == '') {
      list[7] = 'O';
    } else if (list[7].contains('O') &&
        list[8].contains('O') &&
        list[6] == '') {
      list[6] = 'O';
    }
//036
    else if (list[3].contains('O') && list[6].contains('O') && list[0] == '') {
      list[0] = 'O';
    } else if (list[0].contains('O') &&
        list[6].contains('O') &&
        list[3] == '') {
      list[3] = 'O';
    } else if (list[0].contains('O') &&
        list[3].contains('O') &&
        list[6] == '') {
      list[6] = 'O';
    }
//147
    else if (list[4].contains('O') && list[7].contains('O') && list[1] == '') {
      list[1] = 'O';
    } else if (list[1].contains('O') &&
        list[7].contains('O') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[1].contains('O') &&
        list[4].contains('O') &&
        list[7] == '') {
      list[7] = 'O';
    }
//258
    else if (list[5].contains('O') && list[8].contains('O') && list[2] == '') {
      list[2] = 'O';
    } else if (list[2].contains('O') &&
        list[8].contains('O') &&
        list[5] == '') {
      list[5] = 'O';
    } else if (list[2].contains('O') &&
        list[5].contains('O') &&
        list[8] == '') {
      list[8] = 'O';
    }
//048
    else if (list[4].contains('O') && list[8].contains('O') && list[0] == '') {
      list[0] = 'O';
    } else if (list[0].contains('O') &&
        list[8].contains('O') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[0].contains('O') &&
        list[4].contains('O') &&
        list[8] == '') {
      list[8] = 'O';
    }
//246
    else if (list[4].contains('O') && list[6].contains('O') && list[2] == '') {
      list[2] = 'O';
    } else if (list[2].contains('O') &&
        list[6].contains('O') &&
        list[4] == '') {
      list[4] = 'O';
    } else if (list[2].contains('O') &&
        list[4].contains('O') &&
        list[6] == '') {
      list[6] = 'O';
    } else {
      checkBotMove();
    }
    checkWinner();
  }
}
