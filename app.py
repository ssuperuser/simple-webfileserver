##############################################
# Main file to run the server with endpoints #
##############################################

from flask import Flask, abort, send_from_directory
from configs import *
import os

app = Flask(__name__)


@app.route("/file/<path:file>", methods=['GET', 'POST'])
def download(file):
    if file:
        if os.path.exists(os.path.join(os.getcwd(), DOWNLOAD_FOLDER, file)):
            return send_from_directory(DOWNLOAD_FOLDER, filename=file)
        else:
            abort(404, "File not present on server")

    else:
        abort(400, "Specify the file name")


if __name__ == '__main__':
    app.run(host=SERVER_HOST, port=SERVER_PORT)


















#@app.route('/uploads/<path:filename>', methods=['GET', 'POST'])
#def download(filename):
#    return send_from_directory(directory=app.config['UPLOAD_FOLDER'], filename=filename)
