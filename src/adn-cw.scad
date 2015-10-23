
// ADN Clone Wars
module adncw(num, name){

    // numeral sign
    num = str("#", num);

    echo(str("Generating ", num, " ", name));

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

            // bloque principal
            cube ([largo, ancho, grosor]);                                                  

            // positivo dientes.
            translate ([-largodientes,-anchodientes,0])                                     

            cube([largodientes, 22, grosor]);                                                
        }

        // resta dientes 
        translate ([-largodientes,anchodientes-tolerancia,-0.5])                            
            cube ([largodientes,anchodientes+2*tolerancia,grosor+1]);    

        // taladro cable.
        translate ([-largodientes/2-1,0,grosor/2])   rotate ([90,0,0])                      
            cylinder (h=100,r=eje/2,$fn=24,center=true);                                    

        // taladros cierre
        translate ([largo-6,ancho/2+distanciataladroscierre/2,grosor/2])  
            rotate ([0,90,0]) 
            cylinder (h=15,r=taladro/2, $fn=12);                                            

        // taladros cierre
        translate ([largo-6,ancho/2-distanciataladroscierre/2,grosor/2])  
            rotate ([0,90,0]) 
            cylinder (h=15,r=taladro/2, $fn=12);                                            

        // texto superior (num)
        translate([largo/2,ancho/2-anchoextrusion/2,grosor/2+1]) {                          
            linear_extrude(height = 3) {
                text(name, font = "Liberation Sans", size = 10, valign="top", halign="center");
            }
        }

        // texto inferior (name)
        translate([largo/2,ancho/2+anchoextrusion/2,grosor/2+1]) {                          
            linear_extrude(height = 3) {
                text(num, font = "Liberation Sans", size = 10, valign="bottom", halign="center");
            }
        }
    }    
}


// values for testing (use -D from command line)
num ="16";
name = "Ociorum";

adncw(num, name);




