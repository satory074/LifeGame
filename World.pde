class World{
  Race[] lg;
  
  World(Race[] lg){
    this.lg = lg;
  }
  
  public void init(){
    for(Race lg: this.lg){
      lg.init();
    }
  }

  private int[][] get_battled_life(ArrayList<Life[][]> lifes){
    int[][] races = new int[NBLOCKX][NBLOCKY];
    int[][] doa = new int[NBLOCKX][NBLOCKY];
    
    for (int i=0; i<NBLOCKX; i++){
      for (int j=0; j<NBLOCKY; j++){
        int sum = 0;
        for (int k=0; k<lifes.size(); k++){
          sum += (lifes.get(k)[i][j].getHp() > 0) ?pow(2, k) :0;
        }
        doa[i][j] = sum;
      }
    }
    
    for (int i=0; i<NBLOCKX; i++){
      for (int j=0; j<NBLOCKY; j++){
        switch(doa[i][j]){
          case 0:
            races[i][j] = #ffffff;
            break;        
          case 1:
            races[i][j] = this.lg[0].getColor();
            break;
          case 2:
            races[i][j] = this.lg[1].getColor();          
            break;
          case 3:
            lifes.get(1)[i][j].set_is_alive(false);
            lifes.get(1)[i][j].setHp(0);
            races[i][j] = this.lg[0].getColor();            
            break;
          case 4:
            races[i][j] = this.lg[2].getColor();          
            break;
          case 5:
            lifes.get(0)[i][j].set_is_alive(false);
            lifes.get(0)[i][j].setHp(0);
            races[i][j] = this.lg[2].getColor();            
            break;
          case 6:
            lifes.get(2)[i][j].set_is_alive(false);
            lifes.get(2)[i][j].setHp(0);
            races[i][j] = this.lg[1].getColor();            
            break;
          case 7:
            for(Life[][] l:lifes){
              l[i][j].set_is_alive(false);
              l[i][j].setHp(0);
            }
            races[i][j] = #ffffff;            
            break;          
        }
      }
    }
    
    return races;
  }

  private void show_lifes(ArrayList<Life[][]> lifes){
      int[][] races = get_battled_life(lifes);
  
      stroke(0);
      for (int i=0; i<NBLOCKX; i++){
        for (int j=0; j<NBLOCKY; j++){
          fill(races[i][j]);
          rect(lifes.get(0)[i][j].getX(), lifes.get(0)[i][j].getY(), BLOCK_SIZE, BLOCK_SIZE);
        }
      }
    }
  
  public void dostep(){
    ArrayList<Life[][]> lifes = new ArrayList<Life[][]>();
    for(Race lg: this.lg){
      lifes.add(lg.getLifes());
    }
    
    show_lifes(lifes);
  }
}