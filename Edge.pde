class Edge {
  PVector p0, p1, edgePoint;
  Edge(PVector p0, PVector p1){
    this.p0 = p0;
    this.p1 = p1;
    this.edgePoint = null;
  }
  
  PVector edgePoint(Face f0, Face f1) {
    PVector fp0 = f0.getFacePoint().copy();
    PVector fp1 = f1.getFacePoint().copy();
    PVector pa = p0.copy();
    PVector pb = p1.copy();
    
    pa = PVector.add(pb, pa);
    fp0 = PVector.add(fp1, fp0);
    
    PVector ep = PVector.add(fp0, pa);
    return ep.div(4);
  }

  String afficherEdge() {
    String res  = "";
    res += "edge p0:" + p0 + "|p1:" + p1 + " ";
    return res;
  }
  
  PVector getP0() {return p0;}
  PVector getP1() {return p1;}
  void setP0(PVector p0) {this.p0 = p0;}
  void setP1(PVector p1) {this.p1 = p1;}
  void setEdgePoint(PVector p) {this.edgePoint = p;}
  
  boolean estEgale(Edge e) {
    return (((e.p0.x == p0.x) && (e.p0.y == p0.y) && (e.p0.z == p0.z) && (e.p1.x == p1.x) && (e.p1.y == p1.y) && (e.p1.z == p1.z)) || ((e.p1.x == p0.x) && (e.p1.y == p0.y) && (e.p1.z == p0.z) && (e.p0.x == p1.x) && (e.p0.y == p1.y) && (e.p0.z == p1.z)));
  }
  
  boolean containsPoint(PVector p) {
    return (((p0.x == p.x) && (p0.y == p.y) && (p0.z == p.z)) || ((p1.x == p.x) && (p1.y == p.y) && (p1.z == p.z)));
  }
}
