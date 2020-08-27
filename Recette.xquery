xquery version "3.0" encoding "utf-8";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method  "xhtml";
declare option output:media-type  "text/html";
declare option output:omit-xml-declaration "no";
declare option output:doctype-public "-//W3C//DTD XHTML 1.0 Transitional//EN";
declare option output:doctype-system "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd";
declare option output:encoding "utf-8";
declare option output:indent   "yes";

<html >
	<head>
		<title></title>
	</head>
	<body>
		<div>
			<ul>
				<h2>Liste des auteurs</h2>
				{
					for $auteur in doc("recette.xml")//auteur,
					$autrec in doc("recette.xml")//recette,
					$autsc in doc("recette.xml")//Sous_Categorie
					let $autref := $autrec/Auteur/@ref_auteur
					where 
					$auteur/@id_aut=$autref and
					$autrec/@categorie= $autsc/@id_scat
					order by data($auteur/prenom)
					return 
					<li>
						<p>les recettes de {data($auteur/prenom)} {data($auteur/nom)}</p>
							<ul>
									<li>{data($autrec/titre)} de la sous-categorie 	<i>{data($autsc/@nom)}</i>								</li>
							
							</ul>
						
					</li>
				
				}
			</ul>
		</div>
	</body>
</html>