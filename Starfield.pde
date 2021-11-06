
public Entity[] entities;

public void setup(){
  size(600,600);
  entities = new Entity[201];
  entities[200] = (new TieFighter(500,500));
  initShapes();
}

public void draw(){
  background(0);
  updateShapes();
  
  
}


private void initShapes(){
  for(int i = 0; i < 200; i++){
    entities[i] = (new Entity(width - rnum(10), rnum(height), rnum(10), rnum(height)));
  }
}

private void updateShapes(){
  for(int i = 0; i < entities.length; i++){
    Entity entity = entities[i];
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
          String[] phrases = new String[3];
          phrases[0] = ("I have you now!");
          phrases[1] = ("Surrender now rebel scum!");
          phrases[2] = ("You're in my sights");
          String phrase = phrases[((int)(Math.random() * 3))];
          fighter.setPhrase(phrase);
        }
      }
    }
  }
}


private int rnum(int range){
  return (int) (Math.random()*range);
}


