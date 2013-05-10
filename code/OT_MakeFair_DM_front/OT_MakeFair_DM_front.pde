/*****************************************
 This is the front side of DM  made for Openlab.Taipei attending Make Fair Taiwan 2013

 Setting:
 - using variable 'scale' to set the scale ratio for previewing (default value is 3.55 for basic preview resolution in fixed ratio of A3 size)
 - using variable 'printWidth' to set the resolution for real printing out!!  (A3 size in pixel with 300dpi is 4961 x 3508 pixel )

 Usage:
 - press 't' to produce huge solution image for printing
 - press 'l' to show reference line for layouting

 
 Developing Environment: Processing 2.0b8
 Author: Shen, Sheng-Po (http://shengpo.github.io)
 License: CC BY-SA 3.0
 *****************************************/



//for scaling preview resolution
float scale = 3.55;        //default value is 3.55 for basic preview resolution in fixed ratio of A3 size
//float scale = 2.5;        //for testing on small screen

//for real printing size of width (in pixel)
//int printWidth = 4961;        //this is the default resolution for A3 size in pixel with 300dpi (4961 x 3508 pixel)
int printWidth = int(4961*2);        //just for geting better printing result (maybe)


//for constent
PShape ot_logo = null;
PImage processing = null;
PImage puredata = null;
PImage arduino = null;
PImage blender = null;
PImage fritzing = null;
PImage gimp = null;
PImage of = null;
PImage inkscape = null;
PImage reprap = null;

//for reference image maker
ReferenceImageMaker referenceImageMaker = null;

//for pin manager
PinManager pinManager = null;
int cols = int(34*scale);                //pin的column數
int rows = int(25*scale);              //pin的row數

//aTileSaver (for producing huge resolution image for printing out)
aTileSaver tiler = null;  

//switch showing reference lines
boolean isShowReferenceLine = false;



void setup() {
        size(int(420*scale), int(297*scale), P3D);        //以A3大小為例
        background(255);
        
        /*for content*/
        //setting font type
        //println(PFont.list());
        textFont(createFont("SansSerif", 5*scale));
        textAlign(LEFT, CENTER);
//        textMode(SHAPE);

        //other resources
        ot_logo = loadShape("ot_logo.svg");
        processing = loadImage("processing.png");
        puredata = loadImage("puredata.png");
        arduino = loadImage("arduino.png");
        blender = loadImage("blender.png");
        fritzing = loadImage("fritzing.png");
        gimp = loadImage("gimp.png");
        of = loadImage("of.png");
        inkscape = loadImage("inkscape.png");
        reprap = loadImage("reprap.png");

        ot_logo.scale(0.28*scale);
        processing.resize(int(18*scale), 0);
        puredata.resize(int(18*scale), 0);
        arduino.resize(int(18*scale), 0);
        blender.resize(int(18*scale), 0);
        fritzing.resize(int(18*scale), 0);
        gimp.resize(int(18*scale), 0);
        of.resize(int(18*scale), 0);
        inkscape.resize(int(18*scale), 0);
        reprap.resize(int(18*scale), 0);


        /*for background image*/
        //for reference image maker
        referenceImageMaker = new ReferenceImageMaker();
        //for pin manager
        pinManager = new PinManager(cols, rows);
        
        /*for producing huge resolution image*/
        tiler=new aTileSaver(this);
}


void draw() {
        if (tiler==null) return; // Not initialized  

        // call aTileSaver.pre() to prepare frame and setup camera if it exists.  
        tiler.pre();  

        //---start of drawing content
        background(255);

        //get reference image
        PImage img = referenceImageMaker.getImage();
        
        //show pin shadow animation    
        pinManager.update(img);
        pinManager.show();

        //show main content
        showContent();

        //reference lines
        if (isShowReferenceLine) {
                stroke(0, 180, 0);
                strokeWeight(1);
                line(width/2, 0, width/2, height);
        }
        //---end of drawing content

        // call aTileSaver.post() to update tiles if tiler is active  
        tiler.post();
}


void keyPressed() {
        if (key=='t'){
                int tileNumber = printWidth/width;
                tiler.init("Sample"+nf(frameCount, 5), tileNumber);        //最後一個參數表示要將整個畫面切成幾乘幾的tile
        }

        if (key == 'l') {
                isShowReferenceLine = !isShowReferenceLine;
        }
}

