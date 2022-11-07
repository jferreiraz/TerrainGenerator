// Definition of variables

int columns, rows;     

int scale = 20;        //terrain scale
int width = 4000;      //terrain width
int height = 2000;     //terrain height

float [][] terrain;
float cam = 0;         //camera point of view

// Void function for configuration

void setup() {
  size(500, 500, P3D);  //screen size
  
  columns = width / scale;
  rows = height / scale;
  
  terrain = new float[columns][rows];
  
}

// Void function for make the draw

void draw(){
  cam -= 0.0255;  //terrain generation speed
  
  float yoff = cam;  //generating the terrain
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < columns; x++){
      terrain[x][y] = map(noise(xoff,yoff), 0, 0.95, -300, 300);
      xoff += random(0.0199,0.02);
    }
    yoff += 0.02;
  }

  stroke(random(100,125),random(100,115),random(100,115));  //iridiscent gray of the lines
  fill(19,19,20);                                           //filling the lines
  background(10,10,10);                                     //background color
  
  translate(width/4, height/4);       //v
  rotateX(PI/3);                      //positioning camera
  translate(-width/2.5, -height/3);   //^
  
  for(int y = 0; y < rows - 1; y++){  //modifying terrain surface
  beginShape(TRIANGLE_STRIP);
  for(int x = 0; x < columns; x++){
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y+1) * scale, terrain[x+1/3][y+1]);
      //vertex((x+1) * scale, Y * scale, terrain[x][y+1]); 
      vertex((x+1) * scale, y * scale, terrain[x+1/3][y]); 
    }
    endShape();
  }
}
