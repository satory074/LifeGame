int limitX(int n){
  if (n == -1) 
    return NBLOCKX - 1;
  if (n == NBLOCKX) 
    return 0;
  else 
    return n;
}

int limitY(int n){
  if (n == -1) 
    return NBLOCKY - 1;
  if (n == NBLOCKY) 
    return 0;
  else 
    return n;
}

class Race{
  private Life[][] lifes;
  private int col;
  
  private boolean[][] before_is_alive = new boolean[NBLOCKX][NBLOCKY];
  
  Race(Life[][] lifes, color col){
    this.lifes = lifes;
    this.col = col;
  }
  
  
  public void init(){
    for (int x=0; x<NBLOCKX; x++){
      for (int y=0; y<NBLOCKY; y++){
        boolean rnd = boolean(int(round(random(1.0))));
        
        if (rnd) {
          this.lifes[x][y] = new Life(x*BLOCK_SIZE, y*BLOCK_SIZE, 1);
        } else {
          this.lifes[x][y] = new Life(x*BLOCK_SIZE, y*BLOCK_SIZE, 0);
        }
        
        this.lifes[x][y].set_is_alive(rnd);
      }
    }
  }
  
  public int getColor(){
    return this.col;
  }
  
  
  private void copy_lifes(){
    for (int x=0; x<NBLOCKX; x++){
      for(int y=0; y<NBLOCKY; y++){
        this.before_is_alive[x][y] = this.lifes[x][y].get_is_alive();
      }
    }
  }
  
  private void init_calive(){
    for (int x=0; x<NBLOCKX; x++){
      for(int y=0; y<NBLOCKY; y++){
        this.lifes[x][y].initCalive();
      }
    }
  }
  
  private void update_is_alive(){
    for (int x=0; x<NBLOCKX; x++){
      for(int y=0; y<NBLOCKY; y++){
        this.lifes[x][y].set_is_alive(
          (this.lifes[x][y].getHp() > 0) ?true :false
          );
      }
    }
  }
  
  private void count_alive(){
    for (int x=0; x<NBLOCKX; x++){
      for (int y=0; y<NBLOCKY; y++){
        
        if (this.lifes[x][y].get_is_alive()){
          for (int i=-1; i<=1; i++){
            for (int j=-1; j<=1; j++){
              if (i != 0 || j != 0){
                this.lifes[limitX(x+i)][limitY(y+j)].add_calive();
              }
            }
          }
        }
        
      }
    }
  }
  
  public Life[][] getLifes(){
    copy_lifes(); //生死のcopyalive()
    init_calive(); 
    count_alive();
    
    for (Life[] rlife: lifes){
      for (Life life: rlife){
        switch(life.get_calive()){
          case 0:
            life.setHp(0);
            break;
          case 1:
            life.setHp(0);
            break;
          case 2:
            break;
          case 3:
            life.setHp(1);
            break;
          case 4:
            life.setHp(0);
            break;
          case 5:
            life.setHp(0);
            break;
          case 6:
            life.setHp(0);
            break;
          case 7:
            life.setHp(0);
            break;
          case 8:
            life.setHp(0);
            break;
          default:
          break;
        }
      }
    }
    
    update_is_alive();
    
    return this.lifes;
  }
}