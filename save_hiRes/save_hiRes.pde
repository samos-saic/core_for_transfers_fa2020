/*Code example for students in Core for Transfers @SAIC Fall 2020
This example we will use a gridlayout to tile svg graphics to create
basic truchet tile designs and save as a PDF
*/

// First we need to import the following libraries:  HYPE Framework with extended behaviors and the Processing PDF library.

import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.colorist.HColorPool; 

import processing.pdf.*;

// This section we declare variables 

HDrawablePool pool_svg; 
HColorPool colors, colors2;

void setup() {
 size(800,800);
 
 H.init(this).background(#242424); 
 noLoop();

 
 colors = new HColorPool(#306266, #BEB286,#E9AE0B,#E08132, #720f03,#cfcfcf, #ffffff ); //initialize the variable
 
 colors2 = new HColorPool(#ff3300, #ffffff, #cfcfcf, #000000);
 pool_svg = new HDrawablePool(100); //create a pool of 64 assets
 pool_svg.autoAddToStage()
  .add(new HShape("tile1.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER).anchorAt(H.CENTER))
  .add(new HShape("tile4.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER).anchorAt(H.CENTER))
  .add(new HShape("tile5.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER).anchorAt(H.CENTER))
  .add(new HShape("tile6.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER).anchorAt(H.CENTER))
  .add(new HShape("tile7.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER).anchorAt(H.CENTER))

//Here we define the grid layout
  .layout(new HGridLayout().startX(50).startY(50).spacing(100, 100).cols(8))

  .onCreate(
   new HCallback() {
    public void run(Object obj) {
     HShape svg1 = (HShape) obj;
     svg1
      .noStroke()
      //.fill(colors.getColor()) 
      .size(100)
      .rotation( ((int)random(4)) * 90 )
     ;
    svg1.randomColors(colors); // randomize colors throughout the entire svg file
    }
   }
  )
  .shuffleRequestAll()
 ;
 //saveVector();
 noLoop();

}

void draw() {
H.drawStage();
    save("normal.png");
    saveHiRes(5);
 
}

void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires.png");
}

void saveVector(){
  PGraphics tmp = null;
  tmp = beginRecord(PDF, "render.pdf");
  
  if (tmp == null) {
    H.drawStage();
  } else {H.stage().paintAll(tmp, false, 1);
  }
  
  endRecord();
   
  }
