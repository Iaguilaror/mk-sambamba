MKSHELL=/bin/bash

## TARGET:atributos: PREREQ
results/%.markdup.bam: data/%.bam
	set -x
	mkdir -p $(dirname $target)
	echo "[DEBUGGING] marking duplicates for $target"
	echo "[DEBUGGING] using $prereq as input"
	sambamba_v0.6.6 markdup $prereq $target.build \
	&& mv $target.build $target
