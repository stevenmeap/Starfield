
public ArrayList<Entity> entities;

public void setup(){
  size(600,600);
  entities = new ArrayList();
  entities.add(new TieFighter(500,500));
 
  initShapes();
}

public void draw(){
  background(0);
  updateShapes();
  
  
}


private void initShapes(){
  for(int i = 0; i < 200; i++){
    entities.add(new Entity(width - rnum(10), rnum(height), rnum(10), rnum(height)));
  }
}

private void updateShapes(){
  for(int i = 0; i < entities.size(); i++){
    Entity entity = entities.get(i);
    entity.move();
    entity.display();
  }
}

private ArrayList<String> phrases(){
  ArrayList<String> phrases = new ArrayList();
  phrases.add("I have you now!");
  phrases.add("Surrender now rebel scum!");
  phrases.add("You're in my sights");
  return phrases;
}

private int rnum(int range){
  return (int) (Math.random()*range);
}

