class Cube {
  Surface s1, s2, s3, s4, s5, s6;
  Face face0, face1, face2, face3, face4, face5;
  PVector p1, p2, p3, p4, p5, p6, p7, p8;
  float largeur, longueur;
  ArrayList<Face> faces;
  ArrayList<Edge> edges;
  
  Cube(PVector p1, PVector p2, PVector p3, PVector p4, float largeur, float longueur) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    this.p4 = p4;
    this.p5 = new PVector(p1.x, p1.y, p1.z + largeur);
    this.p6 = new PVector(p2.x, p2.y, p2.z + largeur);
    this.p7 = new PVector(p3.x, p3.y, p3.z + longueur);
    this.p8 = new PVector(p4.x, p4.y, p4.z + longueur);
    this.largeur = largeur;
    this.longueur = longueur;
    this.faces = new ArrayList<>();
    this.edges = new ArrayList<>();
    
    //Création des edges face 0
    Edge e12 = new Edge(p1, p2);
    Edge e23 = new Edge(p2, p3);
    Edge e34 = new Edge(p3, p4);
    Edge e41 = new Edge(p4, p1);
    edges.add(e12);
    edges.add(e23);
    edges.add(e34);
    edges.add(e41);
    ArrayList<Edge> edges0 = new ArrayList<>();
    edges0.add(e12);
    edges0.add(e23);
    edges0.add(e34);
    edges0.add(e41);
    ArrayList<PVector> point0 = new ArrayList<>();
    point0.add(p1);
    point0.add(p2);
    point0.add(p3);
    point0.add(p4);
    face0 = new Face(edges0, 4, 0, point0);
    faces.add(face0);
    
    //Création des edges face 1
    Edge e56 = new Edge(p5, p6);
    Edge e67 = new Edge(p6, p7);
    Edge e78 = new Edge(p7, p8);
    Edge e85 = new Edge(p8, p5);
    edges.add(e56);
    edges.add(e67);
    edges.add(e78);
    edges.add(e85);

    ArrayList<Edge> edges1 = new ArrayList<>();
    edges1.add(e56);
    edges1.add(e67);
    edges1.add(e78);
    edges1.add(e85);
    ArrayList<PVector> point1 = new ArrayList<>();
    point1.add(p5);
    point1.add(p6);
    point1.add(p7);
    point1.add(p8);
    face1 = new Face(edges1, 4, 1, point1);
    faces.add(face1);


    //Création des edges face 2
    Edge e43 = new Edge(p4, p3);
    Edge e37 = new Edge(p3, p7);
    e78 = new Edge(p7, p8);
    Edge e84 = new Edge(p8, p4);
    edges.add(e43);
    edges.add(e37);
    edges.add(e84);
    ArrayList<Edge> edges2 = new ArrayList<>();
    edges2.add(e43);
    edges2.add(e37);
    edges2.add(e78);
    edges2.add(e84);
    ArrayList<PVector> point2 = new ArrayList<>();
    point2.add(p4);
    point2.add(p3);
    point2.add(p7);
    point2.add(p8);
    face2 = new Face(edges2, 4, 2, point2);
    faces.add(face2);


   //Création des edges face 3
    e12 = new Edge(p1, p2);
    Edge e26 = new Edge(p2, p6);
    Edge e65 = new Edge(p6, p5);
    Edge e51 = new Edge(p5, p1);
    edges.add(e26);
    edges.add(e65);
    edges.add(e51);
    ArrayList<Edge> edges3 = new ArrayList<>();
    edges3.add(e12);
    edges3.add(e26);
    edges3.add(e65);
    edges3.add(e51);
    ArrayList<PVector> point3 = new ArrayList<>();
    point3.add(p1);
    point3.add(p2);
    point3.add(p6);
    point3.add(p5);
    face3 = new Face(edges3, 4, 3, point3);
    faces.add(face3);


    
    //Création des edges face 4
    Edge e15 = new Edge(p1, p5);
    Edge e58 = new Edge(p5, p8);
    e84 = new Edge(p8, p4);
    e41 = new Edge(p4, p1);
    edges.add(e15);
    edges.add(e58);
    ArrayList<Edge> edges4 = new ArrayList<>();
    edges4.add(e15);
    edges4.add(e58);
    edges4.add(e84);
    edges4.add(e41);
    ArrayList<PVector> point4 = new ArrayList<>();
    point4.add(p1);
    point4.add(p5);
    point4.add(p8);
    point4.add(p4);
    face4 = new Face(edges4, 4, 4, point4);
    faces.add(face4);


    
    //Création des edges face 5
    e26 = new Edge(p2, p6);
    e67 = new Edge(p6, p7);
    Edge e73 = new Edge(p7, p3);
    e23 = new Edge(p3, p2);
    edges.add(e73);
    ArrayList<Edge> edges5 = new ArrayList<>();
    edges5.add(e26);
    edges5.add(e67);
    edges5.add(e73);
    edges5.add(e23);
    ArrayList<PVector> point5 = new ArrayList<>();
    point5.add(p2);
    point5.add(p6);
    point5.add(p7);
    point5.add(p3);
    face5 = new Face(edges5, 4, 5, point5);
    faces.add(face5);
  }
  
  void display() {
    face0.draw();
    face1.draw();
    face2.draw();
    face3.draw();
    face4.draw();
    face5.draw();
  }
  
  ArrayList<Face> getFaces() {
   return faces; 
  }
  
  ArrayList<Edge> getEdges() {
   return edges; 
  }
  
}
