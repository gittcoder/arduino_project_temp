
import processing.serial.*;
Serial port;

//Variables to use
String temp_c="";
String light_intensity="";
String data="";
int index=0;
PFont font;

void setup()
{
  size(400,400);
  port= new Serial(this,"COM3",9600);
  port.bufferUntil('.');
  font=loadFont("AgencyFB-Bold-200.vlw");
  textFont(font,200);
}

void ddraw()
{
  background(0,0,0);
  fill(46,209,2);
  text(temp_c,70,175);
  fill(0,102,153);
  text(light_intensity,70,370);
}

void serialEvent(Serial port)
{
  data=port.readStringUntil('.');
  data=data.substring(0,data.length()-1);
  //look for comma
  index=data.indexOf(",");
  //fetch celsius
  temp_c=data.substring(0,index);
  //fetch light intensity
  light_intensity=data.substring(index+1,data.length());
}
