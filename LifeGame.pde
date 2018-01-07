int BLOCK_SIZE = 10;
int NBLOCKX = 48;
int NBLOCKY = 32;

World world = new World(
  new Race[]{
    new Race(new Life[NBLOCKX][NBLOCKY], #ff0000),
    new Race(new Life[NBLOCKX][NBLOCKY], #00ff00),
    new Race(new Life[NBLOCKX][NBLOCKY], #0000ff)
});

void settings(){
  size(BLOCK_SIZE * NBLOCKX, BLOCK_SIZE * NBLOCKY + BLOCK_SIZE * 10);
  
  world.init();
}

void draw(){  
  if(frameCount%8==0){
    background(255);
    world.dostep();
  }
}

void mousePressed(){
  world.init();
}