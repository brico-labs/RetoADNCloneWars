module adncw(text="texto"){
    grosor= 6;
    largo= 78;
    ancho= 22;
    eje=3;
    largodientes= 12;
    anchodientes= 5.5;
    taladro= 2.2;
    tolerancia= 0.15;
    distanciataladroscierre= 10;

    difference() {
        union() {
            cube ([largo, ancho, grosor]);      // bloque principal
            translate ([-largodientes,-anchodientes,0])       cube([largodientes, 22, grosor]);       // positivo dientes         
    }
        translate ([-largodientes,anchodientes-tolerancia,-0.5])         cube ([largodientes,anchodientes+2*tolerancia,grosor+1]);  //resta dientes   
        translate ([-largodientes/2-1,0,grosor/2])   rotate ([90,0,0])   cylinder (h=100,r=eje/2,$fn=24,center=true);   // taladro cable  
        translate ([largo-6,ancho/2+distanciataladroscierre/2,grosor/2])  rotate ([0,90,0]) cylinder (h=15,r=taladro/2, $fn=12);    // taladros cierre
        translate ([largo-6,ancho/2-distanciataladroscierre/2,grosor/2])  rotate ([0,90,0]) cylinder (h=15,r=taladro/2, $fn=12);    // taladros cierre
        translate([largo/2,ancho/2,grosor/2+1]) {   // Texto
            linear_extrude(height = 3) {
                text(text, font = "Liberation Sans", size = 8, valign="center", halign="center");
            }
        }    
    }
}

atcg = "#15 Ociorum";
adncw(atcg);




