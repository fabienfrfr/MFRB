#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "en")
#import "@preview/cetz:0.4.2": canvas, draw, tree

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond


#import "@preview/pintorita:0.1.4"
#show raw.where(lang: "pintora"): it => pintorita.render(it.text)

#import "@preview/oxdraw:0.1.0": *

#import "lib.typ": project_style, infobox

#show: project_style.with(
  title: "Projet Quinquennat",
  subtitle: "Comment instaurer un revenu de base en France ?",
  authors: ("MFRB", "")
)

= Le choix de l'écriture inclusive

Le MFRB défend depuis sa création en 2013 le principe d’équité entre tous les individus, peu importe leur genre, autant au travers des structures matérielles que des structures symboliques. Pour cette raison, le MFRB est favorable à l’usage de l’écriture inclusive dans ses documents. 

Pour la rédaction de ce rapport, nous avons décidé d’utiliser, autant que possible, des termes neutres dont l’orthographe du masculin est similaire à celle du féminin. Lorsque les deux orthographes ne peuvent être confondues, nous utilisons les deux termes séparément en première instance, puis le point médian de l’écriture dite inclusive afin d’éviter les répétitions.

= Remerciements
// Section vide dans le texte original

= Qu’est-ce que le MFRB ?

Le Mouvement Français pour un Revenu de Base (MFRB) est une association fondée en mars 2013 qui rassemble des citoyen·ne·s, militant·e·s, expert·e·s et chercheur·euse·s engagé·e·s en faveur de la mise en place d’un revenu de base inconditionnel en France. Son objectif est de promouvoir cette mesure dans le débat public et d’éduquer les citoyen·ne·s à la pertinence de cette mesure afin d’obtenir son instauration par la loi, ou par tout autre moyen conforme à ses principes fondamentaux, et à terme sa reconnaissance comme droit humain universel.

Né dans le cadre de l’Initiative citoyenne européenne pour le revenu de base, le MFRB s’est progressivement structuré autour de plusieurs centaines d’adhérent·es, de groupes locaux répartis sur l’ensemble du territoire et de plusieurs milliers de sympathisant·e·s mobilisé·e·s pour promouvoir l’idée du revenu de base. Depuis sa création, le Mouvement organise régulièrement des rencontres, des événements culturels tels que des ciné-débats, ainsi que plusieurs universités d’été (notamment en 2014, 2017 et 2018). Il a également porté les « Tours de base », des voyages à vélo à travers la France ayant rassemblé de nombreux militant·e·s entre 2017 et 2021.

Depuis 2015, le MFRB contribue activement à l’ancrage du revenu de base dans le débat politique. L’association intervient lors des grandes échéances politiques, notamment en participant à des missions d’information parlementaires et en interpellant les candidat·e·s aux élections nationales. Elle a ainsi coorganisé un colloque au Sénat en 2015, contribué à la mission d’information sénatoriale sur le revenu de base en 2016 et participé aux travaux du rapport sur la réforme des minima sociaux porté par Christophe Sirugue en 2017. En 2019, le Mouvement a contribué au colloque « Renforcer le contrat social : quel revenu pour une société plus solidaire ? » au Palais du Luxembourg. En 2021, il a organisé le colloque « Le revenu universel : vers l’inconditionnalité des droits ? » à l’Assemblée nationale.

Parallèlement, le MFRB a développé un pôle Recherche chargé de recenser les différentes propositions de revenu de base, d’analyser les expérimentations menées en France et à l’international et d’accompagner ces initiatives. Ce travail vise à articuler l’action militante avec la production scientifique. Le MFRB a ainsi publié trois ouvrages et organisé plusieurs centaines d’événements sur l’ensemble du territoire. En 2025, le Mouvement a organisé les États Généreux du Revenu de Base à Alfortville, réunissant une centaine de militant·e·s, chercheur·euse·s, expert·e·s et membres de la société civile autour des enjeux de conception et de mise en œuvre du revenu de base.

Affilié au Basic Income Earth Network (BIEN), le MFRB constitue la principale association française de promotion du revenu de base. Indépendante de tout parti politique et de toute confession, l’association se veut un espace ouvert, inclusif et pluraliste, fédérant une diversité de citoyen·ne·s autour d’un projet commun : repenser la justice sociale, économique et démocratique à travers le revenu de base.

= Qu’est-ce que le revenu de base ?

Le revenu de base, aussi appelé revenu universel ou revenu minimum, est une expression applicable à une diversité de dispositifs visant à procurer à l’ensemble des membres d’une communauté politique les moyens, partiels ou complets, de subvenir à leurs besoins matériels d’existence. Pour mieux saisir la différence entre les appellations, une typologie des propositions de revenu minimum est disponible dans ce court article : « Catherine Collombet, Revenus universels en Europe et dans le monde - Essai de typologie, Mission des relations européennes, internationales et de la coopération, avril 2017 ».

Le revenu de base est un dispositif longuement étudié par une communauté internationale spécialisée composée de militant⸱e⸱s, de chercheur⸱se⸱s et de décideur⸱se⸱s politiques. Cette communauté s’organise principalement autour du Réseau Mondial du Revenu de Base (Basic Income Earth Network), auquel le MFRB est affilié, et qui définit que : 

#quote(block: true)[
  « Un revenu de base est un paiement périodique en monnaie versé à tous sur une base individuelle, sans condition de ressources ni de travail. »
]

La définition mondialement partagée du revenu de base reconnaît un dispositif :
- *Universel* : Chaque membre de la communauté en est bénéficiaire, peu importe ses revenus.
- *Individuel* : Il est versé strictement à chaque personne du foyer et son montant ne dépend pas du revenu global du ménage ni de sa composition.
- *Inconditionnel* : Il est versé sans contrepartie de travail ni d’engagement à chercher un emploi.

Par conséquent, le revenu de base est également :
- *Inaliénable* : Le droit à un revenu de base ne peut être ni révoqué ni cédé. En conséquence, son montant ne peut être saisi.
- *Cumulable* : Il s’additionne à toute forme de salaire issue d’un emploi déjà existant et à toute autre forme de revenu.
- *Permanent* : Chaque bénéficiaire le perçoit sans interruption du début jusqu’à la fin de sa vie.

Le montant n’est pas indiqué dans la définition de manière intrinsèque afin de l’adapter au coût de la vie dans différents pays. Le choix du montant dépend aussi de la décision politique d’une communauté donnée quant aux effets souhaités et au mode de financement choisi. Notons que le revenu de base est versé *a priori*. Il s’oppose en cela à l’impôt négatif qui calcule *a posteriori* les sommes dues, ce qui constitue un délai dangereux pour les personnes en grande précarité.

Le MFRB est favorable au versement mensuel car la régularité du revenu génère de la stabilité psychologique et améliore la confiance générale entre les personnes. Le revenu de base est versé en espèces ou par virement bancaire car les citoyens et citoyennes sont les plus à même de connaître la spécificité de leurs besoins et donc d’y répondre. Ce dispositif doit améliorer la protection sociale au sein d’une communauté. Il ne peut en aucun cas être dévoyé pour amenuiser les droits et conditions de vie des personnes les plus modestes.

Il existe des craintes que le revenu de base soit mal dépensé (alcool, cigarettes). Ces craintes sont infondées selon le rapport de la Banque Mondiale (mai 2014) : les bénéficiaires utilisent ces ressources de façon rationnelle pour améliorer leur qualité de vie (« David K. Evans, Anna Popova, Cash Transfers and Temptation Goods. A Review of Global Evidence, The World Bank, May 2014 »).

Selon l'étude de la Banque Mondiale @evans2014, les craintes sont infondées.

L’argent étant un artefact et une ressource de nature humaine, il a pour objectif de faciliter les échanges et non d’asservir celles et ceux qui n’en ont pas. Le revenu de base affirme que chaque individu doit disposer d’un revenu minimum inconditionnel garantissant sa dignité.

#quote(block: true)[
  « Le revenu de base est un droit inaliénable, inconditionnel, cumulable avec d’autres revenus, distribué par une communauté politique à tous ses membres, de la naissance à la mort, sur base individuelle, sans contrôle des ressources ni exigence de contrepartie, dont le montant et le financement sont ajustés démocratiquement. »
]

= Une proposition qui reçoit du soutien

Depuis la campagne de Benoît Hamon en 2017, l’idée du revenu de base est apparue au cœur du débat politique. De nombreuses personnalités se sont positionnées :
- *Dominique de Villepin* : propose un revenu citoyen de 850 € dégressifs.
- *Nathalie Kosciusko-Morizet* : propose un revenu de base de 470 € couplé à une flat tax de 20%.
- *Fabien Roussel* : souhaite un revenu fixe pour les étudiants de 850 €/mois sans condition.
- *Jean-Luc Mélenchon* : propose une « garantie d’autonomie » de 1063 € pour les 18-25 ans.
- *Yannick Jadot / EELV* : défendent un Revenu Universel d’Existence (RUE) à hauteur de 60% du revenu médian.

Plusieurs organismes étatiques ont publié des rapports :
- *Sénat (2016)* : préconise une expérimentation pas-à-pas.
- *CNAF (2017)* : présente des scénarios de fusion des prestations.
- *France Stratégie (2021)* : préconise d'expérimenter pour les 18-24 ans.

== Zoom sur la proposition de Benoît Hamon en 2017
La proposition s'est complexifiée au fil de la campagne, devenant un impôt négatif de 600 € pour les revenus inférieurs à 1,9 SMIC. Le MFRB n'est pas favorable à l'impôt négatif car il préfère le versement *a priori* pour plus de simplicité.

= Le revenu de base est déjà une réalité

- *Alaska (PFD)* : Depuis 1982, un dividende annuel (300 \$ à 3644 \$) est versé à chaque résident via les revenus pétroliers.
- *Cherokee (USA)* : Revenu inconditionnel via les profits des casinos (environ 4000 \$/adulte).
- *Iran (2010)* : Transformation des subventions énergétiques en transferts monétaires universels (72,5 \$/mois).
- *Îles Marshall (2025)* : Mise en place du revenu « Enra » (800 \$/an par citoyen).

= Enjeux directs d’un revenu de base

== Apporter une réponse au non-recours
Le non-recours (30% à 50% selon la DREES) prive les gens de leurs droits par manque d'information ou complexité. Le revenu de base, par son universalité, élimine de facto ce phénomène.

== Étendre les minima sociaux aux 18-25 ans
Mesure consensuelle visant à ne plus exclure cette classe d'âge du soutien public.

== Trappe à inactivité et effets de seuil
Le système actuel peut décourager la reprise d'emploi si la perte d'allocations est supérieure au gain salarial. Avec le revenu de base, chaque euro gagné s'ajoute au revenu sans dégressivité brutale.

== Simplifier le système
Face à l'inflation normative (1700 décrets/an), le revenu de base fusionne les aides et réduit la bureaucratie.

== Individualiser les prestations sociales
=== Les irrégularités de l’aide à l’enfance
Le système actuel favorise parfois les foyers très aisés (via le quotient familial) ou très modestes, délaissant les classes moyennes. Le revenu de base pour mineur remplace ces dispositifs par une aide individuelle égale pour chaque enfant.

=== Individualiser le RSA
Passer d'une logique de foyer à une logique individuelle évite le « célibat administratif » et protège l'autonomie financière, notamment des femmes face aux violences conjugales.

= Enjeux complémentaires du revenu de base

== Valoriser le travail à temps partiel
Le revenu de base sécurise les travailleurs précaires et permet de choisir un temps partiel sans tomber sous le seuil de pauvreté.

== Partager le temps de travail
Il permet une redistribution du "capital temps" en réduisant la pression à l'emploi à temps plein subi.

== Soutenir le développement des PME
En sécurisant les parcours, il favorise l'entrepreneuriat et les projets indépendants.

= Modéliser l’impact grâce aux expérimentations

Les études (SEED en Californie, Mincome au Canada, etc.) montrent des impacts positifs sur :
- *L'insécurité alimentaire* : Réduction drastique de la faim.
- *L'emploi* : Faible impact sur le temps de travail des actifs, mais augmentation du temps consacré aux études ou au soin (care).
- *La santé et l'éducation* : Amélioration des résultats scolaires et de la santé mentale.
- *La criminalité* : Baisse observée dans plusieurs zones expérimentales.

= Notre position sur les expérimentations
// Section basée sur le texte

= Bibliographie des expérimentations
// Liste des sources citées (Evelyn L. Forget, Banque Mondiale, 


#pagebreak()

//#set bibliography(style: "apa", title: [Bibliographie])
#bibliography("refs.bib")

#pagebreak()

#align(center + bottom)[
  #line(length: 100%)
  #v(1em)
  #quote(block: true, attribution: [Philippe Van Parijs, philosophe, fondateur du B.I.E.N.])[
    « Il s’agit de construire un État social qui mise intelligemment sur l’épanouissement du capital humain plutôt que sur l’astreinte d’un emploi non choisi. »
  ]
]