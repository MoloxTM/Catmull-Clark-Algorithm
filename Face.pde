class Face {
  ArrayList<Edge> edges;
  ArrayList<PVector> points;
  ArrayList<PVector> edgepoints;
  int n, numero;
  PVector fp;
  Color c;
  
  Face(ArrayList<Edge> edges, int n, int numero, ArrayList<PVector> points) {
    this.edges = edges;
    this.n = n;
    this.numero = numero;
    this.points = points;
    this.fp = initFacePoint();
    //print("Je créer la face\n");
    c = new Color((int)random(0, 0), (int)random(0, 0), (int)random(255, 255), 255);
    this.edgepoints = new ArrayList<>();
  }
  
  Face() {
    this.edges = null;
    this.n = 0;
    this.numero = 0;
    this.points = null;
    this.fp = null;
    c = new Color((int)random(0, 0), (int)random(0, 0), (int)random(255, 255), 255);
    this.edgepoints = new ArrayList<>();
  }
  
  void draw() {
<<<<<<< Updated upstream
    beginShape();
=======
    beginShape(drawMethod);
>>>>>>> Stashed changes
      stroke(0, 0, 0);
      strokeWeight(strokeWeight);
      fill(c.r, c.g, c.b, c.opacity);
      vertex(points.get(0).x, points.get(0).y, points.get(0).z);
      vertex(points.get(1).x, points.get(1).y, points.get(1).z);
      vertex(points.get(1).x, points.get(1).y, points.get(1).z);
      vertex(points.get(2).x, points.get(2).y, points.get(2).z);
      vertex(points.get(2).x, points.get(2).y, points.get(2).z);
      vertex(points.get(3).x, points.get(3).y, points.get(3).z);
      vertex(points.get(3).x, points.get(3).y, points.get(3).z);
      vertex(points.get(0).x, points.get(0).y, points.get(0).z);    
    endShape();
  }
  
  PVector initFacePoint() {
    PVector fp = new PVector();
    for(PVector v : points) {
      fp.add(v);
    }
    fp = fp.div(4);
    //print("FacePoint de la face n°:" + numero + " fp:" + fp + "\n");
    return fp;
  }
  
  boolean containsPoint(PVector v) {
    for(int i = 0; i < points.size(); i++){
      PVector vi = points.get(i);
      if((vi.x == v.x) && (vi.y == v.y) && (vi.z == v.z)) return true;
    }
    return false;
  }
  
  boolean containsEdge(Edge e) {
    for(int i = 0; i < n ; i++){
      if(edges.get(i).estEgale(e)) return true;
    }
    return false;
  }
  
  String afficherEdges() {
    String res = "";
    for(Edge e : edges) {
      res += e.afficherEdge();
    }
    return res;
  }
  
  String afficherEdgeP() {
    String res = "";
    for(PVector ep : edgepoints) {
      res += ep;
      res += " ";
    }
    return res;
  }
  
  void afficherFace() {
    print("\nFace n°" + numero + " nombre de côté :" + n + "\nListe de points:" + points + "\nliste des edges:" + afficherEdges() + "\nFace point :" + fp + "\nEdge point :" + edgepoints + "\n");
  }
  
  ArrayList<Edge> getEdges() {return edges;}
  ArrayList<PVector> getEdgepoints() {return edgepoints;}
  PVector getFacePoint() {return fp;}
  int getN() {return n;}
  
  void setEdges(ArrayList<Edge> edges){this.edges = edges;}
  void setN(int n){this.n = n;}  
}
