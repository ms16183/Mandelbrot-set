final float reLeft = -2.3;
final float reRight = 0.7;
final float imLower = -1.5;
final float imUpper = 1.5;

final int calcMax = 100;

float transformPixelToMathX(int x){
  return x * (reRight-reLeft) / width + reLeft;
}

float transformPixelToMathY(int y){
  return y * (imUpper-imLower) / height + imLower;
}

void mandelbrotset(){

  final int th = 100;
  int n;

  float re = 0.0;
  float im = 0.0;

  float xn = 0.0;
  float yn = 0.0;
  float xn1 = 0.0;
  float yn1 = 0.0;

  // Seek all pixels.
  for(int py = height; py >= 0; py--){
    for(int px = 0; px < width; px++){

      // Transform pixel-coordinates to mathematical coordinates.
      re = transformPixelToMathX(px);
      im = transformPixelToMathY(py);

      xn = yn = 0.0;
      for(n = 1; n <= calcMax; n++){
        // x_(n+1) = x_n^2 - y_n^2 + re
        // y_(n+1) = 2x_ny_n + im
        xn1 = xn*xn - yn*yn + re;
        yn1 = 2*xn*yn + im;
        if(xn1 > th) break;
        if(yn1 > th) break;
        // update
        xn = xn1;
        yn = yn1;
      }

      stroke(255 *(n/calcMax), 0, 0);
      point(px, py);
    }
  }
}


void setup(){
  size(640, 480);
}

void draw(){
  background(0);
  stroke(255, 0, 0);
  mandelbrotset();
}
