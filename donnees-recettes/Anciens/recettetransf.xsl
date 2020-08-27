<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">


<xsl:output method="xhtml" indent="yes"/>
<xsl:template match="/">
		<!-- appel de la page d'accueil-->
		<xsl:call-template name="page_accueil"/>
		<!-- appel de la liste des recettes-->
		<xsl:call-template name="recettes"/>
		<!-- creation de la liste des ingredients-->
		<xsl:call-template name="ingredients"/>
		<!-- creation de la liste des auteurs-->
		<xsl:call-template name="auteurs"/>
		<xsl:call-template name="categories"/>
		<xsl:call-template name="fiche_auteur"/>
		<xsl:call-template name="fiche_ingredient"/>
		<xsl:call-template name="fiche_recette"/>
		<xsl:call-template name="fiche_categories"/>
		<xsl:call-template name="fiche-sous-categories"/>
		<xsl:call-template name="fiche_produit"/>
	</xsl:template>
	<!--creation de l'entete contenant le menu et les titres-->
	<xsl:template name="menu_header">
		<div id="header">
			<h3>ALLEZ MARSEILLE VIVE LA GASTRONOMIE !!!!</h3>
		</div>
		<div id="nav">
			<ul>
				<li>
					<a href="index.xhtml">Home</a>
				</li>
				<li>
					<a href="auteurs.xhtml">Auteurs</a>
				</li>
				<li>
					<a href="categories.xhtml">Catégorie de Plat</a>
				</li>
				<li>
					<a href="recettes.xhtml">Recettes</a>
				</li>
				<li>
					<a href="ingredients.xhtml">Ingrédients </a>
				</li>
				
				<li>
					<a href="produits.xhtml">Produits </a>
				</li>
			</ul>
		</div>
		<div id="intro">
			<p>
				<i>
					<b>   AMU CUISINE </b>
				</i>est un site de recettes de cuisine en ligne gratuit.Parcourez nos pages à la recherche de recettes gourmandes, illustrées par des photographies alléchantes.</p>
			<img src="images/image1.png" alt="lime"/>
		</div>
	</xsl:template>
	<!--creation du footer , c'est le bas de page qu'on appellera dans les differents template ci dessous  -->
	<xsl:template name="footer">
		<div id="footer">
			<div id="section1">
				<h3>Nos partenaires</h3>
				<ul>
					<li>
						<a href="http://www.odelices.com/"> Odelices</a>
					</li>
					<li>
						<a href="http://www.odelices.com/cours-de-cuisine/">Cours de cuisine </a>
					</li>
				</ul>
			</div>
			<div id="section2">
				<h3>Nos sponsors</h3>
				<ul>
					<li>
						<a href="http://www.univ-amu.fr/">Aix Marseille Université</a>
					</li>
					<li>
						<a href="http://www.crous-aix-marseille.fr/">CROUS Marseille</a>
					</li>
					<li>
						<a href="http://www.lsis.org/sellamis/index.html">Sellami Sana</a>
					</li>
				</ul>
			</div>
			<div id="section3">
				<h3>Suivez nous</h3>
				<ul>
					<li>
						<a href="https://twitter.com/?lang=fr">Twitter</a>
					</li>
					<li>
						<a href="https://www.facebook.com">Facebook</a>
					</li>
				</ul>
			</div>
		</div>
	</xsl:template>
	<!--template contenant l'index.xhtml-->
	<xsl:template name="page_accueil">
		<xsl:result-document href="index.xhtml">
			<html>
				<head>
					<title/>
					<link rel="stylesheet" href="styles.css" type="text/css" media="screen" />
				</head>
				<body>
					<div id="entete">
						<xsl:call-template name="menu_header"/>
					</div>
					
					
					
					Bienvenue dans la page d'accueil 
					<!--<xsl:variable name="refAut" select="@ref_auteur"/>
				<xsl:for-each select="//recette[difficulté=&quot;Facile&quot;]">
							<xsl:call-template name="faire-une-liste">
								<xsl:with-param name="objets">
									<xsl:text>auteurs/</xsl:text>
								</xsl:with-param>
								<xsl:with-param name="nom" select="@ref_auteur"/>
							</xsl:call-template>
				</xsl:for-each>-->
			<i>Essayez les recettes faciles au debut, ci dessous les auteurs des recettes faciles. Amusez vous bien</i>
				<xsl:variable name="facile" select="//recette[difficulté='Facile']/Auteur/@ref_auteur"/>

<xsl:variable name="auteur_facile" select="//auteur[@id_aut=$facile]"/>

			<xsl:for-each select="$auteur_facile">
				<ul>
						 <li><strong><a  href="{@id_aut}.xhtml"><font color="black"><xsl:value-of select="concat(nom,' ',prenom)"/></font> </a></strong><p> </p> </li>
				 </ul>
			</xsl:for-each><p> </p>
			
			<i>les recettes composez de 5 ingredients</i>
			<xsl:variable name="rec5" select="//recette[count(ingredientsRec/ingredientRec)=5]"/>
			<xsl:for-each select="$rec5">
				<ul>
						 <li><strong><a  href="{@id_rec}.xhtml"><font color="black"><xsl:value-of select="titre"/></font> </a></strong><p> </p> </li>
				 </ul>
			</xsl:for-each><p> </p>
				<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<!--template contenant la liste des recettes-->
	<xsl:template name="recettes">
		<xsl:result-document href="recettes.xhtml" encoding="utf-8">
			<html>
				<head>
					<title>AMU CUISINE</title>
					<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
				</head>
				<body>
					<!-- appel de l'entete-->
					<xsl:call-template name="menu_header"/>
					<p> </p>
					<div id="titre">
						<strong> Liste de recettes </strong>
					</div>
					<div id="corps">
						<div id="content">
							<xsl:for-each select="//recette">
								<ul class="column">
									<li>
										<div class="block">
											<a href="{@id_rec}.xhtml">
												<img alt="image">
													<xsl:attribute name="src"><xsl:value-of select="photo"/></xsl:attribute>
												</img>
											</a>
											<br/>
											<h6 align="center">
												<a href="{@id_rec}.xhtml">
													<xsl:value-of select="titre"/>
												</a>
											</h6>
										</div>
									</li>
								</ul>
							</xsl:for-each>
						</div>
					</div>
					<!-- notre pied de page -->
					<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	
<!--template contenant la liste des produits-->
	<xsl:template name="produits">
		<xsl:result-document href="produits.xhtml" encoding="utf-8">
			<html>
				<head>
					<title>AMU CUISINE</title>
					<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
				</head>
				<body>
					<xsl:call-template name="menu_header"/>
					<br/>
					<div id="titre">
						<strong>Liste des produits </strong>
					</div>
					<ul>
						<xsl:for-each select="//produits/produit">
							<li>
								<p>
									<strong>
										<a href=" {@id_pro}.xhtml">
											<font color="black">
												<xsl:value-of select="string(@nom)"/>
											</font>
										</a>
									</strong>
								</p>
							</li>
						</xsl:for-each>
					</ul>
					<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>	
	
	<!-- template contenant la liste des ingredients-->
	<xsl:template name="ingredients">
		<xsl:result-document href="ingredients.xhtml" encoding="utf-8">
			<html>
				<head>
					<title>AMU CUISINE</title>
					<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
				</head>
				<body>
					<!-- **************** appelle l'entete ************* -->
					<xsl:call-template name="menu_header"/>
					<br/>
					<strong>
						<div id="titre"> Listes des Ingredients </div>
					</strong>
					<xsl:for-each select="//ingredients/ingredient">
						<li>
							<strong>
								<a href="{string(@nom)}.xhtml">
									<p>
										<font color="black">
											<xsl:value-of select="string(@nom)"/>
										</font>
									</p>
								</a>
							</strong>
						</li>
					</xsl:for-each>
					<br/>
					<!-- ******************appelle au regle qui contient notre pied de page ******************************-->
					<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	
	
	
	<!-- template  contenant la liste des auteurs-->
	<xsl:template name="auteurs">
		<xsl:result-document href="auteurs.xhtml" encoding="utf-8">
			<html>
				<head>
					<title>AMU CUISINE</title>
					<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
				</head>
				<body>
					<xsl:call-template name="menu_header"/>
					<br/>
					<div id="titre">
						<strong>Liste des auteurs </strong>
					</div>
					<ul>
						<xsl:for-each select="//auteurs/auteur">
							<li>
								<p>
									<strong>
										<a href=" {@id_aut}.xhtml">
											<font color="black">
												<xsl:value-of select="concat(nom,' ',prenom )"/>
											</font>
										</a>
									</strong>
								</p>
							</li>
						</xsl:for-each>
					</ul>
					<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<!-- template generant une page xhtml par recette-->
	<xsl:template name="fiche_recette">
		<xsl:for-each select="//recette">
			<xsl:result-document href="{@id_rec}.xhtml" encoding="utf-8">
				<html>
					<head>
						<title>AMU CUISINE</title>
						<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
					</head>
					<body>
						<xsl:call-template name="menu_header"/>
						<br> </br>
						<ul>
							<li>
								<p>
									<strong>Titre   :</strong>
									<a href=" {@id_rec}.xhtml">
										<font color="black">
											<strong>
												<xsl:value-of select="titre"/>
											</strong>
										</font>
									</a>
								</p>
							</li>
						</ul>
						<table>
							<tr>
								<td id="bord">
									<a href=" {photo}">
										<img src="{photo}" border="2px" height="320" width="320" alt="lime"/>
									</a>
									<br/>
								</td>
								<td style="padding:10px;">
									<!-- variable permettant de faire le lien entre les recettes-auteurs-->
									
									<xsl:variable name="refScat" select="@categorie"/>
									<br/>
									<ul>
										<li>
										<xsl:variable name="refAut" select="Auteur/@ref_auteur"/>
											<strong>Auteur                :</strong>
											<a href="{Auteur/@ref_auteur}.xhtml">
												<font color="black"> <xsl:value-of select="//auteur[@id_aut=$refAut]/nom"></xsl:value-of>
													<xsl:value-of select="//auteur[@id_aut=$refAut]/prenom"/>
												</font>
											</a>
										</li>
										<li>
											<strong>Sous-Categorie                :</strong>
											<a href="{@categorie}.xhtml">
												<font color="black">
													<xsl:value-of select="//Sous_Categorie[@id_scat=$refScat]/@nom"/>
												</font>
											</a>
										</li>
										<li>
											<strong>Difficulte                       :</strong>
											<font color="black">
												<xsl:value-of select="difficulté"/>
											</font>
										</li>
										<li>
											<strong>Nombre personne          :</strong>
											<font color="black">
												<xsl:value-of select="nbPersonne"/>
											</font>
										</li>
										<li>
											<strong>Note                             :</strong>
											<font color="black">
												<xsl:value-of select="note"/>
											</font>
										</li>
										<li>
											<strong>Date de publication        :</strong>
											<font color="black">
												<xsl:value-of select="@datePubli"/>
											</font>
										</li>
										<li>
											<strong>Temps de preparation    :</strong>
											<font color="black">
												<xsl:value-of select="temps/preparation"/>
											</font>
										</li>
										<li>
											<strong>Temps de cuisson         :</strong>
											<font color="black">
												<xsl:value-of select="temps/cuisson"/>
											</font>
										</li>
										<li>
											<strong>Temps de repos             :</strong>
											<font color="black">
												<xsl:value-of select="temps/repos"/>
											</font>
										</li>
										<li>
											<strong>Resumé                        :</strong>
											<font color="black">
												<xsl:value-of select="string(description)"/>
											</font>
											<p> </p>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Ingrédients:</strong>
									<!-- boucle pour parcourir les ingredients dans une recette  -->
									<xsl:for-each select="//ingredientRec">
										<!-- variable permettant de recuperer la reference des ingredients pour ensuite la comparer plus bas-->
										<xsl:variable name="refing" select="@ref"/>
										<ul>
											<li>
												<a href="{//ingredients/ingredient[@id_ing=$refing]/@nom}.xhtml">
													<font color="black">
														<xsl:value-of select="//ingredients/ingredient[@id_ing=$refing]/@nom"/>
													</font>
												</a>
											</li>
										</ul>
									</xsl:for-each>
								</td>
							</tr>
						</table>
						<xsl:call-template name="footer"/>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<!--template generant une page xhtml par auteur-->
	<xsl:template name="fiche_auteur">
		<xsl:for-each select="//auteurs/auteur">
			<!-- une fiche par auteur -->
			<xsl:result-document href="{@id_aut}.xhtml" encoding="utf-8">
				<html>
					<head>
						<title>AMU CUISINE</title>
						<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
					</head>
					<body>
						<xsl:call-template name="menu_header"/>
						<div id="section4">
							<ul>
								<li>
									<p>
										<strong>Nom	  	                         :</strong>
										<xsl:value-of select="concat(nom,' ',prenom )"/>
									</p>
								</li>
								<li>
									<p>
										<strong>Sexe  	                         :</strong>
										<xsl:value-of select="@sexe"/>
									</p>
								</li>
								<li>
									<p>
										<strong>Pays	  	 					:</strong>
										<xsl:value-of select="pays"/>
									</p>
								</li>
								<li>
									<p>
										<strong>Biographie	  	 			 :</strong>
										<xsl:value-of select="string(biographie)"/>
									</p>
								</li>
								<li>
									<p>
										<strong>Liste de recettes             :</strong>
									</p>
									<!-- variable faisant le lien auteurs-recettes-->
									<xsl:variable name="refRec" select="@id_aut"/>
									<xsl:variable name="recs-aut" select="//recette[Auteur/@ref_auteur=$refRec]"/>
										<ul>
										<xsl:for-each select="$recs-aut">
											<li>
												<p>
										<a href="{@id_rec}.xhtml">
											<font color="black">
												<xsl:value-of select="titre"/>
											</font>
										</a>
									</p>
								</li>
								
							</xsl:for-each>
							</ul>
							</li>
							</ul>
						</div>
						<xsl:call-template name="footer"/>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<!--template generant une page xhtml par ingredient-->
	<xsl:template name="fiche_ingredient">
		<xsl:for-each select="//ingredient">
			<xsl:variable name="ing" select="@nom"/>
			<xsl:result-document href="{$ing}.xhtml" encoding="utf-8">
				<html>
					<head>
						<title>AMU CUISINE</title>
						<!-- lien vers la feuille de style css -->
						<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
					</head>
					<body>
						<!-- appelle au regle qui traite le menu -->
						<xsl:call-template name="menu_header"/>
						<ul>
							<li>
								<p>
									<strong>Nom	  	                         :</strong>
									<xsl:value-of select="@nom"/>
								</p>
							</li>
							<li>
								<p>
									<strong>Apport Nutritif	  	         :</strong>
									<xsl:value-of select="string(apportNutri)"/>
								</p>
							</li>
							<li>
								<p>
									<strong>Apport Energitique	  	 :</strong>
									<xsl:value-of select="string(apportEnergie)"/>
								</p>
							</li>
							<li>
								<p>
									<strong>Descriptif	  					 :</strong>
									<xsl:value-of select="string(descriptif)"/>
								</p>
							</li>
							<li>
								<p>
									<strong>Saison	  	 					 :</strong>
									<xsl:value-of select="string(saison)"/>
								</p>
							</li>
						</ul>
						<p>
							<strong>Liste des recettes  relatives à l'ingredient :</strong>
						</p>
						<!-- lien -->
						<xsl:variable name="lien_ing" select="@id_ing"/>
						<xsl:variable name="lien_recette" select="//recette[ingredientsRec/ingredientRec/@ref=$lien_ing]"/>
						<ul>
							<xsl:for-each select="$lien_recette">
								<li>
									<p>
										<a href="{@id_rec}.xhtml">
											<font color="black">
												<xsl:value-of select="titre"/>
											</font>
										</a>
									</p>
								</li>
							</xsl:for-each>
						</ul>
						<xsl:call-template name="footer"/>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<!--template contenant la liste des categories-->
	<xsl:template name="categories">
		<xsl:result-document href="categories.xhtml" encoding="utf-8">
			<html>
				<head>
					<title>AMU CUISINE</title>
					<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
				</head>
				<body>
					<xsl:call-template name="menu_header"/>
					<!--*******************************corps de notre page categories.xhtml ***********************************-->
					<p/>
					<div id="titre">
						<strong> Liste des catégories </strong>
					</div>
					<xsl:for-each select="//Categorie">
						<p>
							<strong>
								<a href=" {@id_cat}.xhtml">
									<font color="black">
										<xsl:value-of select="@nom"/>
									</font>
								</a>
							</strong>
						</p>
						<ul>
							<li>
								<p>
									<strong>         Descriptif	  	:</strong>
									<xsl:value-of select="Description_Categorie"/>
								</p>
							</li>
						</ul>
					</xsl:for-each>
					<br/>
					<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<!--template contenant la liste des  sous-categories-->
	<xsl:template name="fiche-sous-categories">
		<xsl:for-each select="//Sous_Categorie">
			<xsl:variable name="scat" select="@id_scat"/>
			<xsl:result-document href="{$scat}.xhtml" encoding="utf-8">
				<html>
					<head>
						<title>AMU CUISINE</title>
						<!-- lien vers le feuille de style css -->
						<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
					</head>
					<body>
						<xsl:call-template name="menu_header"/>
						<ul>
							<li>
								<p>
									<strong>Nom	  	                         :</strong>
									<xsl:value-of select="@nom"/>
								</p>
							</li>
						</ul>
						<p>
							<strong>Liste des recettes  relatives à cette sous-categorie :</strong>
						</p>
						<!-- lien -->
						<!--<xsl:variable name="lien_scat" select="@id_scat"/>-->
						<xsl:variable name="lien_recettes" select="//recette[@categorie=$scat]"/>
						<ul>
							<xsl:for-each select="$lien_recettes">
								<li>
									<p>
										<a href="{@id_rec}.xhtml">
											<font color="black">
												<xsl:value-of select="titre"/>
											</font>
										</a>
									</p>
								</li>
							</xsl:for-each>
						</ul>
						<xsl:call-template name="footer"/>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	 </xsl:template>
	<!--template generant la liste des categories -->
	<xsl:template name="fiche_categories">
			<xsl:for-each select="//Categorie">
			<!-- une fiche par auteur -->
			<xsl:result-document href="{@id_cat}.xhtml" encoding="utf-8">
				<html>
					<head>
						<title>AMU CUISINE</title>
						<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
					</head>
					<body>
						<xsl:call-template name="menu_header"/>
						
							<div id="titre">
						<strong> Liste des catégories </strong>
					</div>
					<xsl:for-each select="//produits/produit">
						<p>
							<strong>
								<a href=" {@id_pro}.xhtml">
									<font color="black">
										<xsl:value-of select="@nom"/>
									</font>
								</a>
							</strong>
						</p>
						<ul>
							<li>
								<p>
									<strong>         Liste Ingredient	  	:</strong>
									<xsl:value-of select="ingrédient"/>
								</p>
							</li>
						</ul>
					</xsl:for-each>
						
						<xsl:call-template name="footer"/>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	
	</xsl:template>
	
    <!-- template generant une page xhtml par produit-->
    <xsl:template name="fiche_produit">
      <xsl:for-each select="//produits/produit">
      
      
			<xsl:result-document href="{@id_aut}.xhtml" encoding="utf-8">
				<html>
					<head>
						<title>AMU CUISINE</title>
						<link rel="stylesheet" href="styles.css" type="text/css" media="screen"/>
					</head>
					<body>			
									<!-- appelle au regle qui traite le menu -->
						<xsl:call-template name="menu_header"/>
						<ul>
							<li>
								<p>
									<strong>Nom	  	                         :</strong>
									<xsl:value-of select="@nom"/>
								</p>
							</li>
							
									<p>
										<strong>Liste des Ingredient         :</strong>
									</p>
									<!-- variable faisant le lien auteurs-recettes
									<xsl:variable name="recat" select="@id_cat"/>
									<xsl:variable name="recscat" select="//Sous_Categorie[Cat_Ref/@ref_cat=$recat]"/>
										<ul>
										<xsl:for-each select="$recscat">
											<li>
												<p>
										<a href="{@id_scat}.xhtml">
											<font color="black">
												<xsl:value-of select="@nom"/>
											</font>
										</a>
									</p>
								</li>
								
							</xsl:for-each>
							</ul>-->
							
							</ul>
						
						<xsl:call-template name="footer"/>
					</body>
				</html>
			</xsl:result-document>
      </xsl:for-each>    
    
    </xsl:template>	
		
	<!--regle nommée avec parametres pour construire une liste de liens a partir d’un ensemble de noeuds. -->
	<xsl:template name="faire-une-liste">
		<xsl:param name="objets"/>
		<xsl:param name="nom"/>
		<!--production d'une liste de liens vers les objets-->
		<li>
			<a href="{$objets}{$nom}.html">
				<xsl:value-of select="$nom"/>
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>
