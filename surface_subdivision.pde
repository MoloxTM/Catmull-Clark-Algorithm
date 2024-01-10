import controlP5.*;

ControlP5 cp5;
Axes axes;
Surface[] terrain;

float verticaleTranslate = 0;
float horizontaleTranslate = 0;
float depthTranslate = 0;
float rotationX = 0;
float rotationY = 0;
float constX = 0;
float constY = 0;
float k;

PVector gravity;
int meshToDisplay = 0;
int strokeWeight = 0;
int drawMethod = 5;
int iuttonPosY;
boolean keyW, keyA, keyS, keyD, keySpace, keyCtrl, keyY, keyX;
PVector p0, p1, p2, p3;

Cube cube;
Mesh mesh0, mesh1, mesh2, mesh3, mesh4, mesh5;

void setup() {
  
  size(1080, 720, P3D);
  
  //Set up GUI
  iuttonPosY = 600;
  cp5 = new ControlP5(this);
  
  cp5.setFont(createFont("Arial", 10));

  
  cp5.addButton("i0")
     .setPosition(20, iuttonPosY)
     .setSize(20, 20);
     
  cp5.addButton("i1")
     .setPosition(50, iuttonPosY)
     .setSize(20, 20);
     
  cp5.addButton("i2")
     .setPosition(80, iuttonPosY)
     .setSize(20, 20);
     
  cp5.addButton("i3")
     .setPosition(110, iuttonPosY)
     .setSize(20, 20);
     
  cp5.addButton("i4")
     .setPosition(140, iuttonPosY)
     .setSize(20, 20);
     
  cp5.addButton("i5")
     .setPosition(170, iuttonPosY)
     .setSize(20, 20);
  
  cp5.addButton("Lines")
     .setPosition(20, 100)
     .setSize(30, 20);
     
  cp5.addButton("Quads")
     .setPosition(60, 100)
     .setSize(30, 20);
     
  cp5.addSlider("StrokeWeight")
     .setPosition(20, iuttonPosY + 30)
     .setSize(200, 20)
     .setRange(0, 10)
     .setValue(5)
     .setColorLabel(color(0, 0, 0));
   
  //Set up algorithm
  axes = new Axes(200, 200, 200);
  
  p0 = new PVector(10, 0, 10);
  p1 = new PVector(410, 0, 10);
  p2 = new PVector(410, 400, 10);
  p3 = new PVector(10, 400, 10);
  cube = new Cube(p0, p1, p2, p3, 400, 400);
  mesh0 = new Mesh(cube.getFaces(), cube.getEdges(), cube.getFaces().size());
  mesh1 = new Mesh(cube.getFaces(), cube.getEdges(), cube.getFaces().size());
  mesh2 = new Mesh(cube.getFaces(), cube.getEdges(), cube.getFaces().size());
  mesh3 = new Mesh(cube.getFaces(), cube.getEdges(), cube.getFaces().size());
  mesh4 = new Mesh(cube.getFaces(), cube.getEdges(), cube.getFaces().size());
  mesh5 = new Mesh(cube.getFaces(), cube.getEdges(), cube.getFaces().size());
  
  //Set iterations
  mesh1.faces = mesh1.updateMesh(mesh1.faces);
  
  mesh2.faces = mesh2.updateMesh(mesh2.faces);
  mesh2.faces = mesh2.updateMesh(mesh2.faces);
  
  mesh3.faces = mesh3.updateMesh(mesh3.faces);
  mesh3.faces = mesh3.updateMesh(mesh3.faces);
  mesh3.faces = mesh3.updateMesh(mesh3.faces);
  
  mesh4.faces = mesh4.updateMesh(mesh4.faces);
  mesh4.faces = mesh4.updateMesh(mesh4.faces);
  mesh4.faces = mesh4.updateMesh(mesh4.faces);
  mesh4.faces = mesh4.updateMesh(mesh4.faces);
  
  mesh5.faces = mesh5.updateMesh(mesh5.faces);
  mesh5.faces = mesh5.updateMesh(mesh5.faces);
  mesh5.faces = mesh5.updateMesh(mesh5.faces);
  mesh5.faces = mesh5.updateMesh(mesh5.faces);
  mesh5.faces = mesh5.updateMesh(mesh5.faces);  
  
}

void draw() {
    
  background(200);
  lights();
  pushMatrix();

  translate(horizontaleTranslate, verticaleTranslate + (height/2) , depthTranslate);
  translate(width / 3, -200, -150); 
  rotateX(rotationX);
  rotateY(rotationY);
 
  rotateX(180);
  axes.display();
  meshDisplay();

  
  updateMovement();
  popMatrix();
  
  
  cp5.getController("i0").bringToFront();
  cp5.getController("i1").bringToFront();
  cp5.getController("i2").bringToFront();
  cp5.getController("i3").bringToFront();
  cp5.getController("i4").bringToFront();
  cp5.getController("i5").bringToFront();
  cp5.getController("Lines").bringToFront();
  cp5.getController("Quads").bringToFront();
  cp5.getController("StrokeWeight").bringToFront();
}

ArrayList<Face> meshIteration(int n, Mesh mesh) {
  ArrayList<Face> newFaces = mesh.faces;
  for(int i = 0; i < n; i++) {
    newFaces = mesh.updateMesh(newFaces);
  }
  return newFaces;
}

void i0() {
   meshToDisplay = 0;
 }
 void i1() {
     meshToDisplay = 1;
 }
 void i2() {
     meshToDisplay = 2;
 }
 void i3() {
     meshToDisplay = 3;
 }
 void i4() {
     meshToDisplay = 4;
 }
 void i5() {
     meshToDisplay = 5;
 }
 void Lines() {
     drawMethod = 5;
 }
 void Quads() {
     drawMethod = 17;
 }
 void StrokeWeight(float theValue) {
    strokeWeight = (int)theValue;
 }

void meshDisplay() {
  switch(meshToDisplay) {
    case 0 :
      mesh0.display();
    break;
    case 1 :
      mesh1.display();
    break;
    case 2 :
      mesh2.display();
    break;
    case 3:
      mesh3.display();
    break;
    case 4 :
      mesh4.display();
    break;
    case 5 :
      mesh5.display();
    break;
  }
}

void keyPressed() {
  switch (key) {
    case 'u':
      print("\n -------------UPDATE-------------\n");
      mesh0.faces = mesh0.updateMesh(mesh0.faces);
      break;
    case 's':
      for(Face face : mesh0.faces) {
        face.afficherFace();
      }
      break;
    case ' ':
      keySpace = true;
      break;
    case CODED: // Left Control
      if (keyCode == CONTROL) {
        keyCtrl = true;
      }
      break;
    case 'z':
      keyW = true;
      break;
    case 'q':
      keyA = true;
      break;
    case 'd':
      keyD = true;
      break;
    case 'w':
      keyS = true;
      break;
    case 'y':
      keyY = true;
      break;
    case 'x':
      keyX = true;
      break;
    default:
      break;
  }
}

void keyReleased() {
  switch (key) {
    case ' ':
      keySpace = false;
      break;
    case CODED:
      if (keyCode == CONTROL) {
        keyCtrl = false;
      }
      break;
    case 'z':
      keyW = false;
      break;
    case 'q':
      keyA = false;
      break;
    case 'd':
      keyD = false;
      break;
    case 'w':
      keyS = false;
      break;
    case 'x':
      keyX = false;
      break;
    case 'y':
      keyY = false;
      break;
    default:
      break;
  }
}

void updateMovement() {
  if (keySpace) {
    verticaleTranslate += 10;
  }
  if (keyCtrl) {
    verticaleTranslate -= 10;
  }
  if (keyW) {
    depthTranslate += 10;
  }
  if (keyA) {
    horizontaleTranslate += 10;
  }
  if (keyD) {
    horizontaleTranslate -= 10;
  }
  if (keyS) {
    depthTranslate -= 10;
  }
  if (keyY) {
    constY += 0.01;
    rotationY = constY * PI;
  }
  if (keyX) {
    constX += 0.01;
    rotationX = constX * PI;
  }  
}
