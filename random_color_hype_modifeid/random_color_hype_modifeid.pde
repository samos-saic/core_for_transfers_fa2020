/*Code example for students in Core for Transfers @SAIC Fall 2020
This example we will use a gridlayout to tile svg graphics to create
basic truchet tile designs
*/

// First we need to import the HYPE library 
import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.colorist.HColorPool;
import hype.extended.behavior.HRotate;

// This section we declare variables 

HCanvas canvas;
HDrawablePool pool_svg; // Hey, Computer, create a HDrawablePool and name it pool_svg
HColorPool colors, colors2, colors3; // declare color pool variable

//This is slightly different than Processing because of the added H.init code

void setup() {
 size(800,800);
 H.init(this).background(#202020); 
 //Here we define the variable we declared above 
 
 colors = new HColorPool(#306266, #BEB286,#E9AE0B,#E08132, #720f03); //initialize the variable
 
 colors2 = new HColorPool(#ff3300, #ffffff, #cfcfcf, #000000);
 
 colors3 = new HColorPool(#f8a255, #f76f55, #e14b56, #a83a55, #5f2756, #E08132, #720f03 );
 
canvas = new HCanvas().autoClear(false).fade(5);
    H.add(canvas);

 pool_svg = new HDrawablePool(100); //create a pool of 64 assets
 pool_svg.autoParent(canvas)
  .add(
   new HShape("smile.svg")
   .enableStyle(false)
   .strokeJoin(CENTER)
   .strokeCap(CENTER)
   .anchorAt(H.CENTER)
  )
  .add(
   new HShape("tile_b.svg")
   .enableStyle(false)
   .strokeJoin(CENTER)
   .strokeCap(CENTER)
   .anchorAt(H.CENTER)
  )

//Here we define the grid layout
  .layout(
   new HGridLayout()
   .startX(50)
   .startY(50)
   .spacing(100, 100)
   .cols(8)
  )

  .onCreate(
   new HCallback() {
    public void run(Object obj) {
     HShape svg1 = (HShape) obj;
     svg1
      //.fill(colors3.getColor()) // fill every shape in the svg file with same random color
      .size(50+((int)random(20)*10))// randomize scale
      .rotation( ((int)random(4)) * 90 )// randomize rotation
     ;
    svg1.randomColors(colors);// randomize colors throughout the entire svg file
    
      HRotate rot1 = new HRotate();
  rot1.target(svg1).speed(random(-2,2) );
}
   }
  )
 
  .requestAll()
 ;
 

//H.drawStage();
 //noLoop();
}

void draw() {
   H.drawStage();

}
