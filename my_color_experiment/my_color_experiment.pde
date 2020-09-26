import hype.*;
import hype.extended.colorist.HPixelColorist;
import hype.extended.layout.HGridLayout;

HDrawablePool pool;
int           cellSize = 10;

void setup() {
	size(640,640);
	H.init(this).background(#242424);

	final HPixelColorist colors = new HPixelColorist("dog.png") // enter image here
		.fillOnly()
		 //.strokeOnly()
		//.fillAndStroke()
	;

	pool = new HDrawablePool(3600);
	pool.autoAddToStage()
		.add (new HRect().rounding(4))
		.layout(new HGridLayout().startX(5).startY(5).spacing(cellSize+1,cellSize+1).cols(60))// this is where I can grid
		.onCreate (
			new HCallback(){
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d.noStroke().anchorAt(H.CENTER).size(cellSize);

					colors.applyColor(d);
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
