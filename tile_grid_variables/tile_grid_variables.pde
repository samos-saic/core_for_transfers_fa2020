
PShape tile;
int tile_width= 250;
int tile_height= 250;

void setup() {
  size (600, 600);
  // The file "tile_1a.svg" must be in the data folder
  // of the current sketch to load successfully
  tile = loadShape("tile_1a.svg");
}

void draw() {
  background(#202020);

  for (int i = 0; i < width; i= i +tile_width)
  {
    for (int j = 0; j < height; j= j +tile_height) {
      shape(tile, i, j, tile_width, tile_height);
    }
  }
}  
