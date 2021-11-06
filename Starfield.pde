
public Entity[] entities;
//public TieFighter fighter;

public void setup() {
  size(600, 600);
  entities = new Entity[200];
  //fighter = new TieFighter(500,500);
  initShapes();
}

public void draw() {
  background(0);
  updateShapes();
}


private void initShapes() {
  for (int i = 0; i < 200; i++) {
    entities[i] = (new Entity(width - rnum(10), rnum(height), rnum(10), rnum(height)));
  }
}

private void updateShapes() {
  //fighter.move();
  //fighter.display();

  for (int i = 0; i < entities.length; i++) {
    Entity entity = entities[i];
    entity.move();
    entity.display();
  }
}



private int rnum(int range) {
  return (int) (Math.random()*range);
}

