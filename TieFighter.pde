public class TieFighter extends Entity {
  public TieFighter(int x, int y) {
  
    super(x, y, 0, 0);
    
    phrase = "I have you now!";
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
  
  private String phrase;


  @Override
    public void display() {
    updateTarget();
    pushMatrix();
    noFill();
    stroke(255);
    ellipse(x, y, 15, 15);
    rect(x+15/2, y-15/2, 5, 15);
    rect(x-15/2, y-15/2, 5, 15);
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
