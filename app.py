
import argparse
from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__)
temp_install_path = "/tempInstall"

scripts_dir = os.path.join(os.path.dirname(__file__), 'scripts')
def list_files_recursively(directory):
    file_list = []
    for root, directories, files in os.walk(directory):
        for filename in files:
            filepath = os.path.relpath(os.path.join(root, filename), directory)
            filepath = filepath.replace('\\', '/')
            file_list.append(filepath)
    return file_list

@app.route('/')
def lua_install_file():
    return render_template('install.lua', temp_install_url=temp_install_url)

@app.route(temp_install_path)
def lua_temp_install_file():
    files = list_files_recursively(scripts_dir)
    url = f"{server_url}/scripts/"
    update_url = f"{server_url}/update"
    return render_template('tempInstall.lua', files=files, url=url, update_url=update_url)

@app.route("/update")
def lua_update_file():
    return render_template('update.lua', temp_install_url=temp_install_url)

@app.route('/scripts/<path:filename>')
def show_file(filename):
    try:
        with open(f"{scripts_dir}/{filename}", 'r') as file:
            content = file.read()
        return content
    except FileNotFoundError:
        return "File not found", 404

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Server that expose script for computer craft")
    parser.add_argument("port", type=int, help="Server port")
    parser.add_argument("server_url", type=str, help="Server URL")

    args = parser.parse_args()

    server_url = args.server_url
    temp_install_url = f"{server_url}{temp_install_path}"

    app.run(debug=True, host='0.0.0.0', port=args.port)