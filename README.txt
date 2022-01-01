
ATROCE

Another TRustless Ocaml CompilEr  

30/12/2021


Ce petit compilateur écrit en ocaml compile du c vers mips.
https://github.com/ThomasRgl/atroce

/!\ POUR TESTER LE COMPILATEUR /!\ 

"Make" pour build le projet 
"make test[ 0 - 7 ]" pour lancer un des fichier test automatiquement avec spim   
"make error[ 0 - 7 ]" pour lancer un des fichier error automatiquement avec spim  

Si il y a un probleme à la compilation, atroce.byte est un clone de test.byte 


REGLE DU LANGAGE : 

les règles du langage sont quasiment les memes que le langage c.
Il faut déclarer une fonction main qui sera executé

Le programme est une liste de définition, 
une définition étant une définition de fontcion ou de structure.

Il est possible d'utiliser les if/else, les boucles while et for, de break, return.





DECLARATION: 

pour déclarer une varible, on peut:
int a;
int b,c;
int d = 10, e = 20, f = d + e;


POINTEURS ET TABLEAUX: 

les pointeurs se déclare de cette maniere:
int ^ a; 
puis
a = & uneVariable;
et enfin 
puti(!a);

Il n'est pas possible de déclarer directement un tableau, 
cependant, il est possible de déclarer un pointeur a puis,
a = malloc(10);
ainsi, il est possible de faire
a[ 5 ] = 10;


STRUCTURE:

on la déclare : 
struct myStruct {
    int a;
}

puis 

struct myStruct myVar;
myVar.a = 10;
puti(myVar.a);

CEPENDANT

faute de temps, les structures de plus de 4 bytes ne sont pas du tout au point, 
elle fonctionne parfois mais le compilateur n'est pas encore fait pour les gérer.

POURQUOI?

Je souhaite gérer les structures comme des variables, 
et donc pouvoir les push et les pop. Le probleme est que mon compilateur est encore 
réglé pour gérer des variables de 4 bytes, si il essaie de push ma structure dans la pile, 
il ne va push que les 3 premiers bytes et au moment d'écrire dans ma structure, 
je vais ecraser d'autres éléments de ma stack  

Ce probleme a été théoriquement résolu mais je n'ai pas eu le temps d'implémenter entierement 
la solution.

Cette solution en partie implémenté avec Baselib._type_ qui garde en mémoire la taille de chaque type,
et que je souhaitais utiliser dans mon compilateur pour pouvoir mieux gérer les push et les pop
de ma pile 


LVALUE: 

La maniere dont j'ai géré tout ce qui touche au variables differe du cours.
tout fonctionne par adresse, et lvalue va me renvoyer une adresse que je pourrais utiliser ensuite
pour un assign, je vais mettre la valeur de droite à l'adresse de la lvalue de gauche.
Inversemement, quand lvalue ne se situe pas à gauche du assign, lvalue est une expression qui 
renvoie la valeur à l'adresse donnée 


TYPES: 

La gestion des types n'est absolument pas terminé.
L'objectif était de pouvoir avoir des types "custom" en les déclarant dans Baselib._types_
Le probleme est que actuelement, il existe seulement le type int 
Pour la vérification des types pour un assign ou pour un appel de fonction, 
je concidere les pointeurs comme des int, ainsi il est possible d'aditionner un pointeur à un int.

POINTEURS: 

Pour éviter les problemes de shift reduce, les pointeurs sont déclaré avec "^" et sont déréférencés avec "!"
Comme les pointeurs sont traités comme des int, il est théoriquement possible de faire 
int a;
int b;
b = & a;
puti(!b);

Je n'ai pas obligé mon sémantique à ce que l'opérateur de déréférencement puisse etre 
utilisé que sur des pointeurs.

PUTS:
puts a été modifié, il affiche seulement un charactere à partir de la valeur ascii d'un charactere 


STRING: 

Comme la gestion des string a été vu dans le tp Simplifier, ajouter les string dans mon programme 
n'était pas une priorité, et je n'ai au final pas eu le temps des les implémenter.


CONFLITS SHIFT/REDUCE 

Il y a 2 conflits shift reduce.
Le premier : 
le compilateur ne sait pas interpréter *tab[]
*(tab[]) ou *(tab[])
Note: pas important, ajouter des parenthese regle le probleme

Le deuxieme : 
j'autorise à la fois les if sans else, ET les if d'une seule ligne.
le compilateur ne sait pas interpréter 
if if else 
if {
    if {}
    else{}  
}
ou 

if{
    if{}
}
else{} 

Note: pas important, les développeurs qui font un if d'une ligne ET dans cette ligne font un autre if n'existent pas 



NEGATIF

il n'est pas possible de faire des nombre négatifs
pour faire a = -9 il faut faire a = (0 - 9)
 


FONCTIONS: 

je n'ai pas vérifié les returns des fonction, une fonction peut donc ne rien renvoyer alors qu'elle soit renvoyer qqchose et inversement 
les fonctions n'ont pas de type void 







regle en vrac : 

pas possible de déclarer fonction dans une fonction 

pas de variables globale 

les opérateurs ++ -- += -= sont implémenté 

mes mallocs ne peuvent pas etre free ce qui n'est pas très propre 

je n'ai aucune fonction pour demander un int dans la console 

pas possible de passer un parametre au programme  



Dans une boucle for, il doit y avoir obligatoirement une déclaration au début
ex: non -> for(i = 0; i!=0;i++)
    oui -> for(int i = 0; i!=0;i++)

BUGS: 

Il est possible de déclarer 2 fois la meme fonction, 




my notes  :




Todo: 
o   for
o   if sans else 
o   bloc {}
o   ++ -- 
o   += 
o   struct


x   typedef 
x   meilleur gestion des types 
x   char 
x   liste et char direct decl 
x   intégrer printf !!  
