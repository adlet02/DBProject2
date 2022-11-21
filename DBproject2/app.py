from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
import yaml

app = Flask(__name__)

#configure db
db = yaml.safe_load(open('db.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)

@app.route('/')
def homepage():
    return render_template('index.html')

@app.route('/create')
def create():
    return render_template('create.html')  

@app.route('/read')
def read():
    return render_template('read.html')

@app.route('/update')
def update():
    return render_template('update.html')

@app.route('/delete')
def delete():
    return render_template('delete.html')               

@app.route('/countrycreate', methods=['GET','POST'])
def countryCreate():
    if request.method == 'POST':
        #Fetch form data
        countryDetails = request.form
        cname = countryDetails['cname']
        population = countryDetails['population']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO country(cname, population) VALUES(%s, %s)",(cname, population))
        mysql.connection.commit()
        cur.close()
        return redirect('/countrytable')
    return render_template('CountryCreate.html')

@app.route('/countrydelete', methods=['GET','POST'])
def countryDelete():
    if request.method == 'POST':
        #Fetch form data
        countryDetails = request.form
        cname = countryDetails['cname']
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM country having cname = %s" % (cname))
        mysql.connection.commit()
        cur.close()
        return redirect('/countrytable')
    return render_template('CountryDelete.html')

@app.route('/countryupdate', methods=['GET','POST'])
def countryUpdate():
    if request.method == 'POST':
        #Fetch form data
        countryDetails = request.form
        cname = countryDetails['cname']
        population = countryDetails['population']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE `country` SET country.cname = %s WHERE country.cname = %s" % ())
        mysql.connection.commit()
        cur.close()
        return redirect('/countrytable')
    return render_template('CountryDelete.html')    

@app.route('/countrytable')
def countryTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM Country")
    if resultValue > 0:
        countryDetails = cur.fetchall()
        return render_template('CountryTable.html', countryDetails = countryDetails)

@app.route('/discovercreate', methods=['GET','POST'])
def discoverCreate():
    if request.method == 'POST':
        #Fetch form data
        discoverDetails = request.form
        cname = discoverDetails['cname']
        disease_code = discoverDetails['disease_code']
        first_enc_date = discoverDetails['first_enc_date']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO discover(cname, disease_code, first_enc_date) VALUES(%s, %s, %s)",(cname, disease_code, first_enc_date))
        mysql.connection.commit()
        cur.close()
        return redirect('/discovertable')
    return render_template('DiscoverCreate.html')

@app.route('/discovertable')
def discoverTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM Discover")
    if resultValue > 0:
        discoverDetails = cur.fetchall()
        return render_template('DiscoverTable.html', discoverDetails = discoverDetails)

@app.route('/diseasecreate', methods=['GET','POST'])
def diseaseCreate():
    if request.method == 'POST':
        #Fetch form data
        diseaseDetails = request.form
        disease_code = diseaseDetails['disease_code']
        pathogen = diseaseDetails['pathogen']
        description = diseaseDetails['description']
        id = diseaseDetails['id']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO disease(disease_code, pathogen, description, id) VALUES(%s, %s, %s, %s)",(disease_code, pathogen, description, id))
        mysql.connection.commit()
        cur.close()
        return redirect('/diseasetable')
    return render_template('DiseaseCreate.html')

@app.route('/diseasetable')
def diseaseTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM Disease")
    if resultValue > 0:
        diseaseDetails = cur.fetchall()
        return render_template('DiseaseTable.html', diseaseDetails = diseaseDetails)        

@app.route('/diseasetypecreate', methods=['GET','POST'])
def diseasetypeCreate():
    if request.method == 'POST':
        #Fetch form data
        DiseaseTypeDetails = request.form
        id = DiseaseTypeDetails['id']
        description = DiseaseTypeDetails['description']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO DiseaseType(id, description) VALUES(%s, %s)",(id, description))
        mysql.connection.commit()
        cur.close()
        return redirect('/diseasetypetable')
    return render_template('DiseaseTypeCreate.html')

@app.route('/diseasetypetable')
def diseaseTypeTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM DiseaseType")
    if resultValue > 0:
        diseasetypeDetails = cur.fetchall()
        return render_template('DiseaseTypeTable.html', diseasetypeDetails = diseasetypeDetails)

@app.route('/doctorcreate', methods=['GET','POST'])
def doctorCreate():
    if request.method == 'POST':
        #Fetch form data
        doctorDetails = request.form
        email = doctorDetails['degree']
        degree = doctorDetails['degree']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO doctor(email, degree) VALUES(%s, %s)",(email, degree))
        mysql.connection.commit()
        cur.close()
        return redirect('/doctortable')
    return render_template('DoctorCreate.html')

@app.route('/doctortable')
def doctorTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM Doctor")
    if resultValue > 0:
        doctorDetails = cur.fetchall()
        return render_template('DoctorTable.html', doctorDetails = doctorDetails)

@app.route('/publicservantcreate', methods=['GET','POST'])
def publicservantCreate():
    if request.method == 'POST':
        #Fetch form data
        publicservantDetails = request.form
        email = publicservantDetails['email']
        department = publicservantDetails['department']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO publicservant(email, department) VALUES(%s, %s)",(email, department))
        mysql.connection.commit()
        cur.close()
        return redirect('/publicservanttable')
    return render_template('PublicServantCreate.html')

@app.route('/publicservanttable')
def publicservantTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM publicservant")
    if resultValue > 0:
        publicservantDetails = cur.fetchall()
        return render_template('PublicServantTable.html', publicservantDetails = publicservantDetails)                     

@app.route('/recordcreate', methods=['GET','POST'])
def recordCreate():
    if request.method == 'POST':
        #Fetch form data
        recordDetails = request.form
        email = recordDetails['email']
        cname = recordDetails['cname']
        disease_code = recordDetails['disease_code']
        total_deaths = recordDetails['total_deaths']
        total_patients = recordDetails['total_patients']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO record(email, cname, disease_code, total_deaths, total_patients) VALUES(%s, %s, %s, %s ,%s)",(email, cname, disease_code, total_deaths, total_patients))
        mysql.connection.commit()
        cur.close()
        return redirect('/recordtable')
    return render_template('RecordCreate.html')

@app.route('/recordtable')
def recordTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM record")
    if resultValue > 0:
        recordDetails = cur.fetchall()
        return render_template('RecordTable.html', recordDetails = recordDetails)   

@app.route('/specializecreate', methods=['GET','POST'])
def specializeCreate():
    if request.method == 'POST':
        #Fetch form data
        specializeDetails = request.form
        id = specializeDetails['id']
        email = specializeDetails['email']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO publicservant(id, email) VALUES(%s, %s)",(id, email))
        mysql.connection.commit()
        cur.close()
        return redirect('/specializetable')
    return render_template('SpecializeCreate.html') 

@app.route('/specializetable')
def specializeTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM specialize")
    if resultValue > 0:
        specializeDetails = cur.fetchall()
        return render_template('SpecializeTable.html', specializeDetails = specializeDetails) 

@app.route('/userscreate', methods=['GET','POST'])
def usersCreate():
    if request.method == 'POST':
        #Fetch form data
        usersDetails = request.form
        email = usersDetails['email']
        name = usersDetails['name']
        surname = usersDetails['surname']
        salary = usersDetails['salary']
        phone = usersDetails['phone']                
        cname = usersDetails['cname']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users(email, name, surname, salary, phone, cname) VALUES(%s, %s, %s, %s, %s, %s)",(email, name, surname, salary, phone, cname))
        mysql.connection.commit()
        cur.close()
        return redirect('/userstable')
    return render_template('usersCreate.html')

@app.route('/userstable')
def usersTable():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM users")
    if resultValue > 0:
        usersDetails = cur.fetchall()
        return render_template('UsersTable.html', usersDetails = usersDetails)  

if __name__ == '__main__':
    app.run(debug=True)
