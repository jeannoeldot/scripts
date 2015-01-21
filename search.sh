#!/bin/sh
 
if [ $# -eq 2 ]; then
	nbfin=0
	savIFS=$IFS
	export IFS="^M"
	echo "Recherche en cours..."
	lfil=`find $1 -regex '.*'`
	echo "`echo $lfil | wc -l` fichiers"
	echo $lfil | (while read fichier
	do
		if [ -r $fichier -a ! -d $fichier -a ! -p $fichier -a ! -S $fichier ]; then
			if [ `echo $fichier | grep -i $2 | wc -l` -ge 1 ]; then
				echo "-> fichier correspondant : '$fichier'"
			fi
			nbres=`cat "$fichier" | grep -i "$2" | wc -l`
			if [ $nbres -ge 1 ]; then
				echo "---> $nbres occurence(s) trouvée(s) de '$2' dans $fichier"
				nbfin=`expr $nbfin + 1`
			fi
		fi
	done)
	if [ $nbfin -eq 0 ]; then
		echo "Aucun fichier ne contient \"$2\"."
	fi
	export IFS=$savIFS
else
	echo "Usage : $0 <chemin> <chaine a trouver>"
fi

