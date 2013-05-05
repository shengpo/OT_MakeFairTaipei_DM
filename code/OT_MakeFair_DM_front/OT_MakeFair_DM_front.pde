/*****************************************
 Author: Shen, Sheng-Po (http://shengpo.github.io)
 License: CC BY-SA 3.0
 
 This is the front side of DM  made for Openlab.Taipei attending Make Fair Taiwan 2013

 Usage:
 - press 't' to produce huge solution image
 - press 'l' to show reference line for layouting
 
 *****************************************/

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
PImage facebook = null;
PImage blogger = null;

//for reference image maker
ReferenceImageMaker referenceImageMaker = null;

//for pin manager
PinManager pinManager = null;
int cols = 120;                //pin的column數
int rows = 90;                 //pin的row數

//aTileSaver (for producing huge resolution image for printing out)
aTileSaver tiler = null;  

//switch showing reference lines
boolean isShowReferenceLine = false;



void setup() {
        size(int(420*3.55), int(297*3.55), P3D);        //以A3大小為例
        background(255);
        
        /*for content*/
        //setting font type
        //println(PFont.list());
        textFont(createFont("SansSerif", 18));
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
        facebook = loadImage("facebook.png");
        blogger = loadImage("blogger.png");

        processing.resize(64, 0);
        puredata.resize(64, 0);
        arduino.resize(64, 0);
        blender.resize(64, 0);
        fritzing.resize(64, 0);
        gimp.resize(64, 0);
        of.resize(64, 0);
        inkscape.resize(64, 0);
        reprap.resize(64, 0);
        facebook.resize(64, 0);
        blogger.resize(64, 0);


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
                tiler.init("Simple"+nf(frameCount, 5), 5);        //最後一個參數表示要將整個畫面切成幾乘幾的tile
        }

        if (key == 'l') {
                isShowReferenceLine = !isShowReferenceLine;
        }
}

