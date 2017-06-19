// @author: Tomas de Camino Beck

class TTree {
  int treeSize =20;
  int treeShape=0;
  PVector treePos;


  TTree(float x, float y, float z, int treeSize, int treeShape) {
    this.treeSize =treeSize;
    this.treeShape =treeShape;
    treePos = new PVector(x, y, treeSize*3);
  }


  void drawTree() {
    pushMatrix();
    translate(treePos.x, treePos.y, treePos.z);
    //noFill();
    fill(0, 100, 0, 255);
    //stroke(0,100,0);
    noStroke();
    strokeWeight(1);
    if (treeShape==1) {
      drawCone(20, treeSize, 10);
    } else {
      sphereDetail(10);
      sphere(treeSize);
    }
    pushMatrix();
    translate(0, 0, -10);
    stroke(#A77D22);
    strokeWeight(5);
    line(0, 0, 0, 0, 0, -treeSize*3);
    popMatrix();
    popMatrix();
  }

  void drawCone( float r, float tall, int sides) {
    float a = 0;
    float aInc = TWO_PI / sides;
    pushMatrix();
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; ++i) {
      vertex(0, 0, -tall);
      vertex(r*cos(a), r*sin(a), tall);
      a += aInc;
    }
    endShape();
    popMatrix();
  }
}