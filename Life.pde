class Life{
  private int x = 0;
  private int y = 0;
  
  private int hp = 0;
  private boolean is_alive = true;
  private int calive = 0; //周りのセル
  //TODO: String prop;
  
  Life(int x, int y, int hp){
    this.x = x;
    this.y = y;
    
    this.hp = hp;
  }
  
  
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return this.y;
  }
  
  public int getHp (){
    return this.hp;
  }
  
  public int get_calive(){
    return this.calive;
  }
  
  public boolean get_is_alive(){
    return this.is_alive;
  }
 
  public void setXY(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public void setHp (int hp){
    this.hp = hp;
  }
  
  public void set_is_alive(boolean bool){
    this.is_alive = bool;
  }
  
  public void initCalive (){
    this.calive = 0;
  }
  
  public void add_calive(){
    this.calive++;
  }
}