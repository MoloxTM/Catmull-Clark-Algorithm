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

boolean keyW, keyA, keyS, keyD, keySpace, keyCtrl, keyY, keyX;
PVector p0, p1, p2, p3;
Cube cube;
Mesh mesh;

void setup() {
  
  size(1080, 720, P3D);
  axes = new Axes(200, 200, 200);
  
  p0 = new PVector(0, 0, 0);
  p1 = new PVector(400, 0, 0);
  p2 = new PVector(400, 400, 0);
  p3 = new PVector(0, 400, 0);
  cube = new Cube(p0, p1, p2, p3, 400, 400);
  mesh = new Mesh(cube.getFaces(), cube.getEdges(), cube.getFaces().size());
  
}

void draw() {
  background(200);
  lights();
  pushMatrix();

  translate(horizontaleTranslate, verticaleTranslate + (height/2) , depthTranslate);
  translate(width / 3, 0); 
  rotateX(rotationX);
  rotateY(rotationY);
 
  rotateX(90);
  
  axes.display();
  //cube.display();
  mesh.display();
  
  updateMovement();
  popMatrix();
}


void keyPressed() {
  switch (key) {
    case 'u':
      print("\n -------------UPDATE-------------\n");
      mesh.faces = mesh.updateMesh(mesh.faces);
      break;
    case 's':
      for(Face face : mesh.faces) {
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
