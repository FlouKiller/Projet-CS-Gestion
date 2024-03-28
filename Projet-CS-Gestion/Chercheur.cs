using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetCSGestion
{
    public class Chercheur
    {
        /// <summary>
        /// Initialise une nouvelle instance de la classe Chercheur.
        /// </summary>
        /// <param name="id">L'id du chercheur.</param>
        /// <param name="nom">Le nom du chercheur.</param>
        /// <param name="prenom">Le prenom du chercheur.</param>
        /// <param name="specialiteRecherche">La spécialité re recherche du chercheur.</param>
        /// <param name="anneeThese">L'année de la thèse du chercheur.</param>
        public Chercheur(int id, string nom, string prenom, string specialiteRecherche, int anneeThese)
        {
            Id = id;
            Nom = nom;
            Prenom = prenom;
            SpecialiteRecherche = specialiteRecherche;
            AnneeThese = anneeThese;
        }

        public Chercheur(string nom, string prenom, string specialiteRecherche, int anneeThese)
        {
            Nom = nom;
            Prenom = prenom;
            SpecialiteRecherche = specialiteRecherche;
            AnneeThese = anneeThese;
        }

        /// <summary>
        /// Obtient ou définit l'id du chercheur.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Obtient ou définit le nom du chercheur.
        /// </summary>
        public string Nom { get; set; }

        /// <summary>
        /// Obtient ou définit le prenom du chercheur.
        /// </summary>
        public string Prenom { get; set; }

        /// <summary>
        /// Obtient ou définit la spécialité de recherche du chercheur.
        /// </summary>
        public string SpecialiteRecherche { get; set; }

        /// <summary>
        /// Obtient ou définit l'année de thèse du chercheur.
        /// </summary>
        public int AnneeThese { get; set; }
    }
}
