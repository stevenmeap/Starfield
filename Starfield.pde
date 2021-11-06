
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
    if(entity instanceof TieFighter ){
      TieFighter fighter = (TieFighter) entity;
      if(fighter.isTalking()){
        if(fighter.getTalkTime() > 300){
          fighter.setTalking(false);
          fighter.setTalkTime(0);
          continue;
        }
        fighter.setTalkTime(fighter.getTalkTime() + 1);
        
        fighter.talk();
      }else{
        fighter.setCD(fighter.getCD() + 1);
        if(fighter.getCD() > 500){
          fighter.setCD(0);
          fighter.setTalking(true);
          String phrase = phrases().get((int)(Math.random() * 3));
          fighter.setPhrase(phrase);
        }
      }
    }
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
      if(!(this instanceof TieFighter)){
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
public class TieFighter extends Entity {
  public TieFighter(int x, int y) {
    super(x, y, 0, 0);
    talking = true;
    speed = 3;
  }

  private void updateTarget() {
    targetX = mouseX;
    targetY = mouseY;
  }

  private int talkcd;
  private int talkTime;
  private boolean talking;
  
  private String phrase = "I have you now!";

  public void talk() {
    float ty = y;
    float tx = x;
    if(y + 10 > height)
      ty = y - 10;
    else ty = y + 10;
    
    if(x + 200 > width)
      tx = x - 120;
    else tx = x + 20;
    pushMatrix();
    fill(255);
    text(phrase, tx, ty);
    popMatrix();
  }

  @Override
    public void display() {
    updateTarget();
    pushMatrix();
    noFill();
    stroke(255);
    ellipse(x, y, 15, 15);
    rect(x+15/2, y-15/2, 5, 15);
    rect(x-15/2, y-15/2, -5, 15);
    popMatrix();
  }


  //getters and setters

  public boolean isTalking() {
    return talking;
  }
  public int getTalkTime() {
    return talkTime;
  }

  public void setTalking(boolean talking) {
    this.talking = talking;
  }
  public void setTalkTime(int talkTime) {
    this.talkTime = talkTime;
  }
  
  public void setPhrase(String s){
    phrase = s;
  }
  public void setCD(int cd){
    talkcd = cd;
  }
  public int getCD(){
    return talkcd;
  }
}
