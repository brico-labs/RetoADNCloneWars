module adncw(text="texto",num="num"){
    grosor= 6;
    largo= 78;
    ancho= 22;
    eje=3;
    largodientes= 12;
    anchodientes= 5.5;
    taladro= 2.2;
    tolerancia= 0.15;
    distanciataladroscierre= 10;
    anchoextrusion= 0.8;

difference() {
    union() {
        cube ([largo, ancho, grosor]);                                                  // bloque principal.
        translate ([-largodientes,-anchodientes,0])                                     // positivo dientes.
            cube([largodientes, 22, grosor]);                                                
    }
    translate ([-largodientes,anchodientes-tolerancia,-0.5])                            // resta dientes.  
        cube ([largodientes,anchodientes+2*tolerancia,grosor+1]);    
    translate ([-largodientes/2-1,0,grosor/2])   rotate ([90,0,0])                      // taladro cable.  
        cylinder (h=100,r=eje/2,$fn=24,center=true);                                    
    translate ([largo-6,ancho/2+distanciataladroscierre/2,grosor/2])  rotate ([0,90,0]) // taladros cierre.
        cylinder (h=15,r=taladro/2, $fn=12);                                            
    translate ([largo-6,ancho/2-distanciataladroscierre/2,grosor/2])  rotate ([0,90,0]) // taladros cierre.
        cylinder (h=15,r=taladro/2, $fn=12);                                            
    translate([largo/2,ancho/2-anchoextrusion/2,grosor/2+1]) {                          // Texto superior. 
        linear_extrude(height = 3) {
           text(num, font = "Liberation Sans", size = 10, valign="top", halign="center");
        }
    }
    translate([largo/2,ancho/2+anchoextrusion/2,grosor/2+1]) {                          // Texto inferior. 
        linear_extrude(height = 3) {
           text(text, font = "Liberation Sans", size = 10, valign="bottom", halign="center");
        }
    }
}    
}

num ="#16";
atcg = "Ociorum";
adncw(num,atcg);




