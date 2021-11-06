
public Entity[] entities;

public void setup() {
  size(600, 600);
  entities = new Entity[101];
  entities[100] = new TieFighter(500, 500);
  initShapes();
}

public void draw() {
  background(0);
  updateShapes();
}


private void initShapes() {
  for (int i = 0; i < 100; i++) {
    entities[i] = (new Entity(width - rnum(10), rnum(height), rnum(10), rnum(height)));
  }
}

private void updateShapes() {

  for (int i = 0; i < entities.length; i++) {
    Entity entity = entities[i];
    entity.move();
    if (entity instanceof TieFighter) {
      TieFighter fighter = (TieFighter) entity;
      fighter.show();
      if (fighter.isTalking()) {
        if (fighter.getTalkTime() > 300) {
          fighter.setTalking(false);
          fighter.setTalkTime(0);
        }
        fighter.setTalkTime(fighter.getTalkTime() + 1);

        fighter.talk();
      } else {
        fighter.setCD(fighter.getCD() + 1);
        if (fighter.getCD() > 500) {
          fighter.setCD(0);
          fighter.setTalking(true);
          String phrase = phrases().get((int)(Math.random() * 3));
          fighter.setPhrase(phrase);
        }
      }
    } else entity.display();
  }
}

private ArrayList<String> phrases() {
  ArrayList<String> phrases = new ArrayList();
  phrases.add("I have you now!");
  phrases.add("Surrender now rebel scum!");
  phrases.add("You're in my sights");
  return phrases;
}

private int rnum(int range) {
  return (int) (Math.random()*range);
}
