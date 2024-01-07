class Mesh{
  
  ArrayList<Face> faces;
  ArrayList<Edge> edges;
  Face[] faceNeighboor;
  int n;
  
  Mesh(ArrayList<Face> faces, ArrayList<Edge> edges,int n){
    this.faces = faces;
    this.edges = edges;
    this.n = n;
  }
  
  void display() {
    for(Face face : faces) {
      face.draw();
    }
  }
  
  ArrayList<Face> faceNeighboor(Edge edge) {
    //print("\nO cherche les n pour edge :"+ edge.afficherEdge());
    ArrayList<Face> faceN = new ArrayList<>();
    for(int i = 0; i < n; i++) {
      if(faces.get(i).containsEdge(edge)) {
        faceN.add(faces.get(i));
      }
    }
    return faceN;
  }
  
  boolean edgesContientPoint(PVector p, ArrayList<PVector> edgeWithP) {
    boolean res = false;
    //print("on vrif p:" + p);
    for(int i = 0; i < edgeWithP.size(); i++){
      PVector pi = edgeWithP.get(i).copy();
      //print("pi :" + pi + "i:" + i + "\n");
      if((pi.x == p.x) && (pi.y == p.y) && (pi.z == p.z)) {
        res = true;
      }
    }
    //print("res:" + res +"\n");
    return res;
  }
  
  PVector newPoint(PVector p) {
    ArrayList<PVector> facesNearPoint = new ArrayList<>();
    ArrayList<PVector> edgeWithP = new ArrayList<>();
    
    for(Face face : faces) {
      
      if(face.containsPoint(p)) {
        facesNearPoint.add(face.fp);
      }
      
      int i = 0;
      
      for(Edge edge : face.getEdges()) {
      
        //print("\nnombre de edge :" + i + "\n");
        
        boolean res = edgesContientPoint(edge.edgePoint, edgeWithP);
        
        if(!res && ((edge.p0.x == p.x && edge.p0.y == p.y && edge.p0.z == p.z) || (edge.p1.x == p.x && edge.p1.y == p.y && edge.p1.z == p.z))){
          edgeWithP.add(edge.edgePoint);
          //print("\nAjout de :" + edge.edgePoint);
        }
        
        i++;
      }
    }
    
    for(int i = 0; i < facesNearPoint.size(); i++) {
      //print("\nFace:" + facesNearPoint.get(i));
    }
    
    int n = 4;
    //print("\nNombre de facenear point :" + n );
    
    PVector q = new PVector();
    q = q.copy().add(facesNearPoint.get(0).copy().add(facesNearPoint.get(1).copy().add(facesNearPoint.get(2).copy())));
    q = q.copy().div(3);
    
    PVector r = new PVector();
    r = r.copy().add(edgeWithP.get(0).copy().add(edgeWithP.get(1).copy().add(edgeWithP.get(2).copy())));
    r = r.copy().div(3);
    
    PVector np = p.copy();
    np = np.copy().mult((n-3));
    
    np = np.copy().div(n);
    q = q.copy().div(n);
    r = r.copy().mult(2);
    r = r.copy().div(n);
    
    q = q.copy().add(r.copy().add(np));
    
    PVector newPoint = q.copy();
    return newPoint;
    
  }
  
  Face createNewFace(PVector p0, PVector p1, PVector p2, PVector p3, int i) {
      Face face0 = new Face();
      
      ArrayList<PVector> points0 = new ArrayList<>();
      points0.add(p0);
      points0.add(p1);
      points0.add(p2);
      points0.add(p3);
      
      ArrayList<Edge> edges0 = new ArrayList<>();
      edges0.add(new Edge(points0.get(0), points0.get(1)));
      edges0.add(new Edge(points0.get(1), points0.get(2)));
      edges0.add(new Edge(points0.get(2), points0.get(3)));
      edges0.add(new Edge(points0.get(3), points0.get(0)));
      
      face0.points = points0;
      face0.edges = edges0;
      face0.n = points0.size();
      face0.fp = face0.initFacePoint();
      face0.numero = i;
      
      return face0;
  }
  
  ArrayList<Face> updateMesh(ArrayList<Face> oldFace) {
    ArrayList<Face> newFaces = new ArrayList<>();    
    int j  = 1;
    int h = 1;
    int p = 0;
    //Calcul des edgesPoints
    for(Face f : oldFace) {
      ArrayList<Edge> edgesOfFace = f.getEdges();
      for(Edge e : edgesOfFace) {
        ArrayList<Face> faceProches = faceNeighboor(e);
        //print("\nPour edge n°:"+p);
        p++;
        PVector newEP = e.edgePoint(faceProches.get(0), faceProches.get(1));
        f.edgepoints.add(newEP);
        e.edgePoint = newEP;
        //print("\nedge point n°:" + j + "|" +e.edgePoint + " de la face n°"+h+"\n");        
        j++;
      }
      h++;
    }
    int k = 0;
    for(Face f : oldFace){
      //Crétion des nouveaux points
      ArrayList<PVector> newPoints = new ArrayList<>();
      
      for(int i = 0; i < f.points.size(); i++) {
        PVector np = newPoint(f.points.get(i).copy());
        newPoints.add(np);
      }
      
      PVector facePoint = f.fp;
      ArrayList<PVector> newEdgePoints = f.getEdgepoints();
      //Création des 4 nouvelles faces 
      Face face0 = createNewFace(newPoints.get(0), newEdgePoints.get(0), facePoint, newEdgePoints.get(3), k);
      Face face1 = createNewFace(newEdgePoints.get(0), newPoints.get(1), newEdgePoints.get(1), facePoint, k+1);
      Face face2 = createNewFace(facePoint, newEdgePoints.get(1), newPoints.get(2), newEdgePoints.get(2), k+2);
      Face face3 = createNewFace(newEdgePoints.get(3), facePoint, newEdgePoints.get(2), newPoints.get(3), k+3);
      
      newFaces.add(face0);
      newFaces.add(face1);
      newFaces.add(face2);
      newFaces.add(face3);
      k += 4;
    }
    this.n = newFaces.size();
    //print("\nNombre de nouvelle faces : " + n + "\n");
    return newFaces;
  }
  
  ArrayList<Face> getFaces() {return this.faces;}
  int getN() {return this.n;}
  void setFaces(ArrayList<Face> faces){this.faces = faces;}
  void setN(int n){this.n = n;}
  
}
