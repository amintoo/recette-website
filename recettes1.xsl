<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:output method="xml" indent="yes" />
 <xsl:template match="/">
   <recettes> 
 <xsl:for-each select="//objet[@type = 'recette']">
 
              <recette> 
							   <xsl:attribute name="id_rec"><xsl:value-of select="@id"/></xsl:attribute> 
								<xsl:attribute name="datePubli"><xsl:value-of select="info[@nom='date_publication']/@value"/>              </xsl:attribute>
								<xsl:attribute name="sous-categorie"><xsl:value-of select="info[@nom='sous-catégorie']/@value"/></xsl:attribute>
               

					<titre>
								<xsl:variable name="titre" select="info[@nom='nom']/@value"/>
								<xsl:value-of select="info[@nom='nom']/@value"/> 
					</titre>
					<resumé><xsl:value-of select="info[@nom='résumé']"/> </resumé>
					<photo><xsl:value-of select="info[@nom='photo']/@value"/> </photo>
					<difficulté><xsl:value-of select="info[@nom='difficulté']/@value"/> </difficulté>
					<ingredientsRec>
						<xsl:for-each select="info[@nom='ingrédient']">
						<ingredientRec>
						<xsl:attribute name="ref"><xsl:value-of select="@value"/></xsl:attribute>
						</ingredientRec>
						</xsl:for-each>
			
					</ingredientsRec>
					<temps>
						<preparation><xsl:value-of select="info[@nom='Préparation']/@value"/></preparation>
						<cuisson><xsl:value-of select="info[@nom='Cuisson']/@value"/></cuisson>
						<repos><xsl:value-of select="info[@nom='Repos']/@value"/></repos>
					</temps>
					<description><xsl:value-of select="info[@nom='Préparation']"/> </description>
					<note><xsl:value-of select="info[@nom='note']/@value"/> </note>
					<Auteur ref_auteur="{info[@nom='auteur']/@value}"></Auteur>
					<nbPersonne><xsl:value-of select="info[@nom='nbre_personnes']/@value"/></nbPersonne>
					
		</recette> 
 
 
 </xsl:for-each>
 
<!--***************auteur***************-->

	<auteurs>
				<xsl:for-each select="//objet[@type = 'auteur']">
							<auteur>  
			
   <xsl:attribute name="id_aut"><xsl:value-of select="@id"/></xsl:attribute> 
  <xsl:attribute name="sexe"><xsl:value-of select="info[@nom='sexe']/@value"/></xsl:attribute> 
											<nom><xsl:value-of select="info[@nom='nom']/@value"/></nom>
											<prenom><xsl:value-of select="info[@nom='prenom']/@value"/></prenom>
											<pays> <xsl:value-of select="info[@nom='pays']/@value"/></pays>
											
											<biographie><xsl:value-of select="info[@nom='biographie']/@value"/>
</biographie>
                                <xsl:for-each select="info[@nom = 'recette']">
									   <recette_auteur>
											
											<xsl:value-of select="@value"/>	
											
									   </recette_auteur>
			                   </xsl:for-each>
							</auteur>
	
				</xsl:for-each>
		</auteurs>
 
 <!--****************Categorie************-->
   <Categories>
				<xsl:for-each select="//objet[@type = 'catégorie']">
					<Categorie>
					<xsl:attribute name="id_cat"><xsl:value-of select="@id"/></xsl:attribute> 
				    <xsl:attribute name="nom"><xsl:value-of select="info[@nom='nom']/@value"/></xsl:attribute>
				    <nom><xsl:value-of select="info[@nom='nom-court']/@value"/></nom> 
				    <Description_Categorie><xsl:value-of select="info[@nom='descriptif']"/></Description_Categorie>
				    
										
								
					</Categorie>
							</xsl:for-each>
							
		</Categories>
	<!--****************Sous categorie*************-->
	
    <Sous_Categories>
					<xsl:for-each select="//objet[@type = 'sous-catégorie']">
								<Sous_Categorie>
								
					<xsl:attribute name="id_scat"><xsl:value-of select="@id"/></xsl:attribute> 
				<xsl:attribute name="nom"><xsl:value-of select="info[@nom='nom']/@value"/></xsl:attribute>
				<nom><xsl:value-of select="info[@nom='nom-court']/@value"/></nom> 				
							<DescriptionSCat><xsl:value-of select="info[@nom='descriptif']"/></DescriptionSCat>
							<Cat_Ref ref_cat="{info[@nom='catégorie']/@value}"></Cat_Ref>
									
								</Sous_Categorie>
							</xsl:for-each>
		</Sous_Categories>	
	
	<!-- *********************Ingredient*************************8-->
		<ingredients>
				<xsl:for-each select="//objet[@type = 'ingredient']">
							<ingredient>
									
					<xsl:attribute name="id_ing"><xsl:value-of select="@id"/></xsl:attribute>
					<xsl:attribute name="nom"><xsl:value-of select="info[@nom='nom']/@value"/></xsl:attribute>
					
					<apportEnergie><xsl:value-of select="info[@nom='Apport énergétique']/@value"/></apportEnergie>
					<apportNutritif><xsl:value-of select="info[@nom='Apport nutritif']/@value"/></apportNutritif>
			
					<saison><xsl:value-of select="info[@nom='saison']/@value"/></saison>
					<xsl:for-each select="info[@nom = 'recette']">
					<recetteIngredient>
													
					<xsl:value-of select="@value"/>
													
					</recetteIngredient>
					</xsl:for-each>
				<produit><xsl:value-of select="info[@nom='produit']/@value"/></produit>	
				<DescriptionIngredient><xsl:value-of select="info[@nom='descriptif']"/></DescriptionIngredient>
			
			
		
							
							
							</ingredient>
				</xsl:for-each>
		</ingredients>
		
	<!--***********************produit*****************************-->
<produits>
 <xsl:for-each select="//objet[@type='produit']">
  <produit>
  
<xsl:attribute name="id_pro"><xsl:value-of select="@id"/></xsl:attribute>
<xsl:attribute name="nom"><xsl:value-of select="info[@nom='nom']/@value"/></xsl:attribute>
<xsl:attribute name="nom"><xsl:value-of select="info[@nom='nom-court']/@value"/></xsl:attribute>
 
  
<xsl:for-each select="info[@nom = 'ingrédient']">
					<Ingredient_pro>
					
  <xsl:value-of select="@value"/>	
 
  </Ingredient_pro>
	 </xsl:for-each>				
					
  
  </produit>

 </xsl:for-each>
</produits>


 </recettes>
 
 
 
 
 </xsl:template>
</xsl:stylesheet>
