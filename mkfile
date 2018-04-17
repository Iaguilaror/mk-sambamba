MKSHELL=/bin/bash

## Recete para hacer Galletas de coco
## TARGET:atributos: PREREQ
galletas_de_coco:Q: masa_para_galletas coco_rallado
	echo "darle forma a la masa"
	echo "rociar con el coco rallado"
	echo "hornear"
	echo "aqui estan las galletas" > galletas_de_coco

## Receta para la masa
## OTRO TARGET: SIN PREREQ
masa_para_galletas:
	echo "ir a la tienda por la masa para galletas"
	echo "aqui esta la masa" > masa_para_galletas

## Receta para el coco rallado
## OTRO TARGET: PREREQ
coco_rallado:
	echo "comprar el coco"
	echo "Partir el coco"
	echo "rallarlo"
	echo "aqui esta el coco" > coco_rallado

## Aqui voy a crear un objetivo o receta Virtual
clean:V:
	rm coco_rallado galletas_de_coco masa_para_galletas
