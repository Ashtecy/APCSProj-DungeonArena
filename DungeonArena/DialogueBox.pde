public class DialogueBox {

  protected String [] txt;
  protected String str;

  DialogueBox() {
    txt = new String[6];
    for (int i = 0; i < 3; i++){
     add(""); 
    }
    add("Welcome to DungeonArena");
    add("NUMPAD to move, Q and W to navigate the inventory, E to equipt or use items");
    add("Z X C V to use abilities");
  }

  void add(String newLine) {
    for (int i = txt.length - 1; i >= 1; i--) {
      txt[i] = txt[i - 1];
    }
    txt[0] = newLine;
    updateString();
  }

  void updateString() {
    String temp = "";
    for (int i = txt.length - 1; i >= 0; i--) {
      temp += txt[i] + "\n";
    } 
    str = temp;
  }

  String toString() {
    return str;
  }
}

