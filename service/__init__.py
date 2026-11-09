"""
Microservice initialization
"""
from flask import Flask
from flask_talisman import Talisman

# Initialize Flask app
app = Flask(__name__)

# Initialize Talisman for security headers
talisman = Talisman(app)

# Import the routes after the app is created to avoid circular imports
from service import routes, models
