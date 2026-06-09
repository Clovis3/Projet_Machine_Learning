# 1. Utiliser une image de base officielle Python
FROM python:3.10-slim

# 2. Définir le dossier de travail à l'intérieur du conteneur
WORKDIR /app

# 3. Copier le fichier des dépendances dans le conteneur
COPY requirements.txt .

# 4. Installer les bibliothèques requises
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copier le reste des fichiers du projet (notebooks, données, README)
COPY . .

# 6. Exposer le port par défaut utilisé par Jupyter Notebook
EXPOSE 8888

# 7. Commande d'exécution pour lancer le serveur Jupyter au démarrage du conteneur
CMD ["python", "-m", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]