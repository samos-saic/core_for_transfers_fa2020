/*Code example for students in Core for Transfers @SAIC Fall 2020
This example we will use a gridlayout to tile svg graphics to create
basic truchet tile designs
*/

// First we need to import the HYPE library 
import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.colorist.HColorPool; 

// This section we declare variables 

HDrawablePool pool_svg; // Hey, Computer, create a HDrawablePool and name it pool_svg
HColorPool colors, colors2;// declare color pool variable

//This is slightly different than Processing because of the added H.init code

void setup() {
 size(800,800);
 H.init(this).background(#242424); 
 //Here we define the variable we declared above 
 
 colors = new HColorPool(#306266, #BEB286,#E9AE0B,#E08132, #720f03); //initialize the variable
 
 colors2 = new HColorPool(#ff3300, #ffffff, #cfcfcf, #000000);
 pool_svg = new HDrawablePool(100); //create a pool of 64 assets
 pool_svg.autoAddToStage()
  .add(
   new HShape("smile.svg")
   .enableStyle(false)
   .strokeJoin(CENTER)
   .strokeCap(CENTER)
   .anchorAt(H.CENTER)
  )
  .add(
   new HShape("tile_a.svg")
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
      .stroke(colors2.getColor()
      //.noStroke()
      .strokeWeight(5)
      .fill(colors.getColor())// fill every shape in the svg file with same random color
      //.noFill()
      //.size(50+((int)random(20)*20))// randomiz scale
      .size(100)
      //.loc( (int)random(width), (int)random(height) )//randomize location
      .rotation( ((int)random(4)) * 90 )// randomize rotation
     ;
    svg1.randomColors(colors);// randomize colors throughout the entire svg file
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
