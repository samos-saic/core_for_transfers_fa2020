
PShape tile;
PImage img;

void setup() {
  size (600, 600);
  // The file "tile_1a.svg" must be in the data folder
  // of the current sketch to load successfully
  tile = loadShape("tile_1a.svg");
  img = loadImage("squirrel.jpeg");
}

void draw() {
  background(#202020);
  noLoop();
  //for (int i = 0; i < width; i= i +100)
  //{
  //  shape(tile, i, 0, 100, 100);
  //}

  for (int i = 0; i < width; i= i +100)
  {
    for (int j = 0; j < height; j= j +100) {
      tile.disableStyle();
      tile.setFill(color(random(255)));
      
      image(img, i, j, 100, 100);
      shape(tile, i, j, 100, 100);
      
    }
  }
}  
