# Analyse sensorielle du chocolat
# Chargement des données
donnees <- read.csv("data/raw/chocolat_data.csv")
# Statistiques descriptives
summary(donnees)
# Analyse des préférences
table_preferences <- table(donnees$preference)
print(table_preferences)
# Sauvegarde des résultats
write.csv(table_preferences, "results/tables/preferences_chocolat.csv")
# Test statistique ANOVA
result_anova <- aov(chocolat_noir ~ preference, data = donnees)
summary(result_anova)

# Visualisation
library(ggplot2)
# Création du graphique
p <- ggplot(donnees, aes(x = preference, y = chocolat_noir)) +
  geom_boxplot() +
  labs(title = "Scores du chocolat noir par préférence")
# Affichage
print(p)
# Sauvegarde du graphique
ggsave("results/figures/boxplot_preferences.png", plot = p)
