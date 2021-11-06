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
