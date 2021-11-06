
public ArrayList<Entity> entities;

public void setup(){
  size(600,600);
  entities = new ArrayList();
 
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



public class Entity {
  protected float x;
  protected float y;
  
  private int r;
  private int g;
  private int b;

  protected float targetX, targetY;
  protected float speed;

  public Entity(int x, int y, int targetX, int targetY) {
    this.x = x;
    this.y = y;
    r = (int) (Math.random() * 255);
    g = (int) (Math.random() * 255);
    b = (int) (Math.random() * 255);
    speed = (float) (Math.random() * 5) + 5;
    this.targetX = targetX;
    this.targetY = targetY;
  }


  public void move() {
    float dx = targetX - x;
    float dy = targetY - y;
   // double angle = Math.atan2(dy, dx);
    float toAdd = speed;
    if (x > targetX) {
      x -= toAdd;
    }
    if (x < targetX) {
      x += toAdd;
    }
    if (y > targetY) {
      y -= toAdd;

    }
    if (y < targetY) {
      y+= toAdd;

    }
    if(x - toAdd <= targetX){
      if(this instanceof Entity){
        x = width - rnum(10);
        y = rnum(height);
        speed = rnum(5) + 5;
      }
    }

  }
  
  public void display(){
    pushMatrix();
    noStroke();
    fill(r,g,b);
    ellipse(x, y, 15,15);
    popMatrix();
  }





  //getters and setters

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }

  public void setX(float x) {
    this.x = x;
  }
  public void setY(float y) {
    this.y = y;
  }
  private int rnum(int range){
  return (int) (Math.random()*range);
}
}
