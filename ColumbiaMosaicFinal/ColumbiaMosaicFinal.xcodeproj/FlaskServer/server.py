from flask import Flask
from flask import render_template
from flask import Response, request, jsonify
import json

app = Flask(__name__)

def load_data_from_file():
    try:
        with open('events_data.json', 'r') as file:
            return json.load(file)
    except (FileNotFoundError, json.JSONDecodeError):
        return []

def save_data_to_file(data):
    with open('events_data.json', 'w') as file:
        json.dump(data, file, indent=4)

data = load_data_from_file()
current_id = max([event["id"] for event in data], default=0)

current_id = 0
data = []

@app.route('/')
def home():
    return 'Welcome to Columbia Mosaic Event Form!'

@app.route('/eventform')
def eventform(name=None):
    return render_template('eventform.html', data=data)

@app.route('/submit-event', methods=['POST'])
def submit_event():

    with open('events_data.json', 'r') as file:
        events = json.load(file)

        new_event = {
            'id': len(events) + 1,  
            'title': request.form['event_title'],
            'date': request.form['event_date'],
            'time': request.form['event_time'],
            'location': request.form['event_location'],
            'type': request.form['event_type'],
            'category': request.form['event_category'],
            'description': request.form['event_description']
        }
        events.append(new_event)

    with open('events_data.json', 'w') as file:
        json.dump(events, file, indent=4)

    return jsonify({'message': 'Event submitted successfully!'})
    
@app.route('/get-events', methods=['GET'])
def get_events():
    with open('events_data.json', 'r') as file:
        events = json.load(file)
    return jsonify(events)

if __name__ == '__main__':
   app.run(debug=True)