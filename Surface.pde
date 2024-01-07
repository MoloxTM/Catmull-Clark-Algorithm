class Surface {

  Color couleur;
  PVector p1, p2, p3, p4;
  float largeur, longueur;
  PVector[] points;
  Surface(PVector p1, PVector p2, PVector p3, PVector p4, Color couleur) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    this.p4 = p4;
    this.points = new PVector[] {p1, p2, p3, p4};
    this.couleur = couleur;
  }
  
  void display() {
    beginShape(QUADS);
      stroke(0, 0, 0);
      fill(couleur.r, couleur.g, couleur.b, couleur.opacity);
      vertex(p1.x, p1.y, p1.z);
      vertex(p2.x, p2.y, p2.z);
      vertex(p3.x, p3.y, p3.z);
      vertex(p4.x, p4.y, p4.z);
    endShape();
  }
  
  PVector maxPointY(PVector p1, PVector p2) {
    if(p1.y > p2.y) return p1;
    return p2;
  }
  
  PVector closestPoint(float targetx, float targetz, PVector[] points) {
    PVector closest = p1;
    float minDelta = Float.MAX_VALUE;
    for(int i = 0; i < 4; i++){
      float delta = dist(abs(targetx), abs(targetz), abs(points[i].x), abs(points[i].z));
      if(delta < minDelta) {
        minDelta = delta;
        closest = points[i];
      }
    }
    return closest;
  }
  
  // ATTENTION indice 0 -> x et indice 1 -> z
  PVector[] associatePoints(PVector p) {
    PVector[] res = new PVector[2];
    if((p.x == p1.x) && (p.z == p1.z)) {
      res[0] = p4;
      res[1] = p2;
    } else if((p.x == p2.x) && (p.z == p2.z)){
      res[0] = p3;
      res[1] = p1;      
    } else if((p.x == p3.x) && (p.z == p3.z)){
      res[0] = p2;
      res[1] = p4;      
    } else if((p.x == p4.x) && (p.z == p4.z)){
      res[0] = p1;
      res[1] = p3;      
    }
    return res;
  }
    
  float barryCentric(PVector p1, PVector p2, PVector p3, PVector pos) {
    float det = (p2.z - p3.z) * (p1.x - p3.x) + (p3.x - p2.x) * (p1.z - p3.z);
    float l1 = ((p2.z - p3.z) * (pos.x - p3.x) + (p3.x - p2.x) * (pos.z - p3.z)) / det;
    float l2 = ((p3.z - p1.z) * (pos.x - p3.x) + (p1.x - p3.x) * (pos.z - p3.z)) / det;
    float l3 = 1.0f - l1 - l2;
    return l1 * p1.y + l2 * p2.y + l3 * p3.y;
  }
}
