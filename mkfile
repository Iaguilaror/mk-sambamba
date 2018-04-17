MKSHELL=/bin/bash

## Recete para hacer Galletas de coco
## TARGET:atributos: PREREQ
results/%.galletas:Q: data/%.masa
	mkdir -p `dirname $target`
	echo "me estas pidiendo que haga $target"
	echo "Lo voy a hacer a partir de $prereq"
	touch $target

## Aqui voy a crear un objetivo o receta Virtual
clean:V:
	rm coco_rallado galletas_de_coco masa_para_galletas
