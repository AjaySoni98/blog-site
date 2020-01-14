from flask import Flask, render_template, url_for, request, redirect
from datetime import date
from werkzeug.utils import secure_filename
from flask_mysqldb import MySQL
import yaml
import os
import tempfile

UPLOAD_FOLDER = 'static/images'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

db = yaml.load(open('db.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)

@app.route("/")
@app.route("/home")
def parallax():
    return render_template('parallax.html')

@app.route('/signup', methods=['POST'])
def signup():
    if request.method == 'POST':
        # Fetch form data
        userDetails = request.form
        name = userDetails['name']
        email = userDetails['email']
        username = userDetails['username']
        password = userDetails['password']
        confpassword = userDetails['confpassword']
        profilepic = userDetails['profilepuc']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO user_signup(name, email, username, password, profilepic) VALUES(%s, %s, %s, %s, %s)",(name, email, username, password, profilepic))
        mysql.connection.commit()
        cur.close()
        return render_template('parallax.html')
        
    return render_template('parallax.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    print("Me aalo")
    if request.method == 'POST':
        userLoginDetails = request.form
        email = userLoginDetails['email']
        password = userLoginDetails['password']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * from user_signup where email='" + email + "' and password='" + password + "'")
        cur.execute("SELECT * FROM blog")
        data = cur.fetchall()   
        mysql.connection.commit()
        cur.close()
        return render_template('login-home.html', data=data)
        

    else:
        return "failed"

@app.route("/login-home")
def home():
    return render_template('login-home.html')

@app.route("/post", methods=['POST'])
def post():
    if request.method == 'POST':
        post = request.form
        title = post['post-title']
        descp = post['post-desc']
        imag = request.files['post-image']
        if imag:
            imagname = secure_filename(imag.filename)
            nam = tempfile.NamedTemporaryFile()
            fname = nam.name[::-1]
            imagname = fname[0:10]
            imag.save(os.path.join(app.config['UPLOAD_FOLDER'], imagname))
        image = "static/images/"+imagname
        today = date.today()
        datee = today.strftime("%d %B, %Y")
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO blog(title, description, image, date) VALUES(%s, %s, %s, %s)",(title, descp, image, datee))
        mysql.connection.commit()
        cur.close()
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)