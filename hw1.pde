float[] circleX = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] circleY = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] up = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] left = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] speedX = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] speedY = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] size = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
PShape[] circle = new PShape[10];
float[] touched  = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1};
int count = 0;
int colour = 0;

void setup() {
  fullScreen();
  background(0);
  fill(random(255), random(255), random(255));
  for (int i = 0; i < 10; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height);
    up[i] = random(1);
    left[i] = random(1);
    speedX[i] = random(25);
    speedY[i] = random(25);
    size[i] = random(50, 100);
    circle[i] = createShape(ELLIPSE, circleX[i], circleY[i], size[i], size[i]);
    if (i == 9) {
      circle[i].setFill(color(255, 0, 0));
    }
    shape(circle[i]);
  }
}

void draw() {
  
  background(0);
  
  for (int i = 0; i < 10; i++) {
    
    if (touched[i] == 1) {
      count++;
    }
        
    for (int j = 0;  j < 10;  j++) {
      if (dist(circleX[i], circleY[i], circleX[j], circleY[j]) < size[i]/2 + size[j]/2 && i != j) {
        
        if (touched[j] == 1) {
          touched[i] = 1;
        }
        
        if (touched[i] ==  1) {
          touched[j] = 1;
        }
        
        float temp1 = up[j];
        float temp2 = left[j];
        up[j] =  up[i]; 
        up[i] =  temp1;
        left[j] = left[i];
        left[i] =  temp2;    
      }
    }
    
    circle[i] = createShape(ELLIPSE, circleX[i], circleY[i], size[i], size[i]);
    if (touched[i] == 1) {
      if (colour == 0) {
        circle[i].setFill(color(255, 0, 0));
      } else if (colour == 1) {
        circle[i].setFill(color(0, 0, 255));
      } else if (colour == 2) {
        circle[i].setFill(color(0, 255, 0));
      }
    }
    shape(circle[i]);
    
    if (up[i] == 0) {
      circleY[i] = circleY[i] + speedY[i];
    } else {
      circleY[i] = circleY[i] - speedY[i];
    }
   
    if (left[i] == 0) {
      circleX[i] = circleX[i] + speedX[i];
    } else {
      circleX[i] = circleX[i] - speedX[i];
    }
   
    if(circleY[i] < 0) {
      up[i] = 0;
    }
   
    if(circleY[i] > height) {
      up[i] = 1;
    }
   
    if(circleX[i] < 0) {
      left[i] = 0;
    }
   
    if(circleX[i] > width) {
      left[i] = 1;
    }
    
  }
  
  if (count == 10) {
    fill(random(255), random(255), random(255));
    if (colour < 2) {
      colour++;
    } else {
      colour = 0;
    }
    circle[9] = createShape(ELLIPSE, circleX[9], circleY[9], size[9], size[9]);
    if (colour == 0) {
      circle[9].setFill(color(255, 0, 0));
    } else if (colour == 1) {
      circle[9].setFill(color(0, 0, 255));
    } else if (colour == 2) {
      circle[9].setFill(color(0, 255, 0));
    }
    shape(circle[9]);
    for (int i = 0; i < 9; i++)  {
      touched[i] = 0;
    }
  }
  count = 0;
}
