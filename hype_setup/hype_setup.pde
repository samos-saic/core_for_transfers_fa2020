
import hype.*;
import hype.extended.layout.HGridLayout;

HDrawablePool pool;

void setup() {
 size(800,800);
 H.init(this).background(#242424);

 pool = new HDrawablePool(256);
 pool.autoAddToStage()
  .add(
   new HShape("tile_1a.svg")
   .enableStyle(false)
   .strokeJoin(CENTER)
   .strokeCap(CENTER)
   .anchorAt(H.CENTER)
  )

  .layout(
   new HGridLayout()
   .startX(0)
   .startY(0)
   .spacing(50,50)
   .cols(16)
  )

  .onCreate(
   new HCallback() {
    public void run(Object obj) {
     HDrawable d = (HDrawable) obj;
     d
      .stroke(#999999)
      .strokeWeight(5)
      .fill(#242424)
      .size(100)
      .rotation( ((int)random(4)) * 90 )
     ;
    }
   }
  )
  .requestAll()
 ;

 H.drawStage();
 noLoop();
}

void draw() {

}
