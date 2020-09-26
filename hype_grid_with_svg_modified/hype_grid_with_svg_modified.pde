/*Code example for students in Core for Transfers @SAIC Fall 2020
This example we will use a gridlayout to tile svg graphics to create
basic truchet tile designs
*/

// First we need to import the HYPE library 
import hype.*;
import hype.extended.layout.HGridLayout;

// This section we declare variables 

HDrawablePool pool_svg; // Hey, Computer, create a HDrawablePool and name it pool_svg


//This is slightly different than Processing because of the added H.init code

void setup() {
 size(800,800);
 H.init(this).background(#202020); 

 
 //Here we define the variable we declared above 
 
 pool_svg = new HDrawablePool(64); //create a pool of 64 assets
 pool_svg.autoAddToStage()
  .add(
   new HShape("rects.svg")
   .enableStyle(true)
   .strokeJoin(CENTER)
   .strokeCap(CENTER)
   //.anchorAt(H.CENTER)
  )
    .add(
   new HShape("circles.svg")
   .enableStyle(true)
   .strokeJoin(CENTER)
   .strokeCap(CENTER)
   .anchorAt(H.CENTER)
  )

//Here we define the grid layout
  .layout(
   new HGridLayout()
   .startX(50)
   .startY(50)
   .spacing(100,100)
   .cols(8)
  )

  .onCreate(
   new HCallback() {
    public void run(Object obj) {
     HShape svg1 = (HShape) obj;
     svg1
      .stroke(#999999)
      .strokeWeight(5)
      .fill(#ff3300)
      .size(100 + ((int)random(4)) * 50 )
      .rotation( ((int)random(4)) * 90 )
      //.loc((random(width)), (random(height)))
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
  save("auto_image.png");

}

void keyPressed() {
  if (key == 's') {
    save("typeNameHere.jpg");
  }
}
