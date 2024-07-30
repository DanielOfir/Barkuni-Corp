from flask import Blueprint, jsonify, request

main = Blueprint('main', __name__)

# Sample data
items = [
    {"id": 1, "name": "Vicarius", "description": "This is item 1"},
    {"id": 2, "name": "Barkuni", "description": "This is item 2"},
]

@main.route('/', methods=['GET'])
def welcome():
  return "Hello Vicarius :) Welcome to Barkuni Corp!"

@main.route('/items', methods=['GET'])
def get_items():
    return jsonify(items), 200

@main.route('/items/<int:item_id>', methods=['GET'])
def get_item(item_id):
    item = next((item for item in items if item['id'] == item_id), None)
    if item:
        return jsonify(item), 200
    else:
        return jsonify({"error": "Item not found"}), 404

@main.route('/items', methods=['POST'])
def add_item():
    new_item = request.get_json()
    new_item['id'] = len(items) + 1
    items.append(new_item)
    return jsonify(new_item), 201

@main.route('/items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    item = next((item for item in items if item['id'] == item_id), None)
    if item:
        data = request.get_json()
        item.update(data)
        return jsonify(item), 200
    else:
        return jsonify({"error": "Item not found"}), 404

@main.route('/items/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    global items
    items = [item for item in items if item['id'] != item_id]
    return '', 204
