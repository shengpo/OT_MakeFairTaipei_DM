public class ReferenceImageMaker {
        private PGraphics pg = null;

        private int triangleCount = 80;
        private float[][][] triangles = null;
        
        
        public ReferenceImageMaker(){
                pg = createGraphics(width, height);
                
                //get every vertex on each triangle
                triangles = new float[triangleCount][3][2];
                for(int i=0; i<triangles.length; i++){
                        for(int a=0; a<3; a++){
                                triangles[i][a][0] = random(width);
                                triangles[i][a][1] = random(height);
                        }
                }        
        }
        
        
        public PImage getImage(){
                pg.beginDraw();
                pg.background(255);
                for(int i=0; i<triangles.length; i++){
                        pg.stroke(0);
                        pg.noFill();
                        pg.triangle(triangles[i][0][0], triangles[i][0][1], triangles[i][1][0], triangles[i][1][1], triangles[i][2][0], triangles[i][2][1]);
                }        
                pg.endDraw();
                
                return pg;
        }
}
