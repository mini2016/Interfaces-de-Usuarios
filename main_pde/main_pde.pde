Panel panel;

void setup() {
  size(215,280);
  panel = newPanel();
  panel.add(
    newVBox().gap(10).position(0,0).size(200,280)
    .add(newHBox().size(30,70).position(150, 20)
      .add(newLabel("").size(10,100))
     .add(newLabel("").size(10,30).id("result"))
     .add(newTextField().columns(100).value("0").id("prueba")))
      
      .add(newHBox()
      .add(newButton("C").size(50,40).id("C"))
      .add(newButton("+/-").size(50,40).id("+/-"))
      .add(newButton("%").size(50,40).id("%"))
      .add(newButtonOperation("/").size(60,40).id("/")))
      
       .add(newHBox()
      .add(newButton("7").size(50,40).id("7"))
      .add(newButton("8").size(50,40).id("8"))
      .add(newButton("9").size(50,40).id("9"))
      .add(newButtonOperation("x").size(60,40).id("x")))
      
       .add(newHBox()
      .add(newButton("4").size(50,40).id("4"))
      .add(newButton("5").size(50,40).id("5"))
      .add(newButton("6").size(50,40).id("6"))
      .add(newButtonOperation("-").size(60,40).id("-")))
      
       .add(newHBox()
      .add(newButton("1").size(50,40).id("1"))
      .add(newButton("2").size(50,40).id("2"))
      .add(newButton("3").size(50,40).id("3"))
      .add(newButtonOperation("+").size(60,40).id("+")))
    
      .add(newHBox()
      .add(newButton("0").size(104,50).id("0"))
      .add(newButton(",").size(50,40).id("."))
      .add(newButtonOperation("=").size(60,40).id("=")))
    );
  panel.update();
}

void draw() {
  background(128);
  panel.draw();
}

void mousePressed() {
  panel.mouseDown(mouseX,mouseY,new Click());
}

void mouseReleased() {
  panel.mouseUp(mouseX,mouseY,null);
}

void keyPressed() {
  panel.keyStroke(key,keyCode,null);
}

class Click extends Action {
  void run(Graphic g) {
    Control c = (Control)g;
    if (c.id()=="="){
      printPanel(c);
    }else
    if(c.id()=="+/-"){
      Control result = (Control)panel.getById("prueba");
      float val= Float.parseFloat(result.value());
      float inverso= val*(-1);
      result.value(String.valueOf(inverso));
      panel.update();
    }else
    if(c.id()=="C"){
       Control result = (Control)panel.getById("prueba");
       result.value("0");
       panel.update();
    }
    else{
       Control result = (Control)panel.getById("prueba");
       String val=result.value();
       if(val=="0"){
        result.value(c.id());
       }else{
       result.value(val+c.id());
       }
     panel.update();  
  }
  }
}
  void printPanel(Control c) {
    Control val = (Control)panel.getById("prueba");
    String result=val.value();
    if(result =="C"){
      val.value("0");
    }else{
      print(result);
      String[] suma = result.split("\\+");
      String[] res = result.split("\\-");
      String[] mult = result.split("x");
      String[] div = result.split("\\/");
      String []porc= result.split("\\%");
         if(suma.length ==2){
        float sum1=Float.parseFloat(suma[0]);
        float sum2=Float.parseFloat(suma[1]);
        float dato=sum1+sum2;
        val.value( String.valueOf(dato));
         }else
         if(res.length ==2){
           print(res[0]);
        float res1=Float.parseFloat(res[0]);
        float res2=Float.parseFloat(res[1]);
        float dato=res1-res2;
        val.value( String.valueOf(dato));
         }else
         if(mult.length ==2){
        float mult1=Float.parseFloat(mult[0]);
        float mult2=Float.parseFloat(mult[1]);
        float dato=mult1*mult2;
        val.value( String.valueOf(dato));
         }else
         if(div.length ==2){
       float div1=Float.parseFloat(div[0]);
        float div2=Float.parseFloat(div[1]);
        float dato= div1 / div2;
        val.value( String.valueOf(dato));
         }else
         if(porc.length ==2){
       float num=Float.parseFloat(porc[0]);
        float por=Float.parseFloat(porc[1]);
        float dato=  num*por/100.0; 
        val.value( String.valueOf(dato));
         }
    panel.update();
  }
}