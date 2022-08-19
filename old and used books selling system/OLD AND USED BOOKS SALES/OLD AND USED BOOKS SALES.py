from flask import Flask, render_template, request, redirect,session
from DBConnection import Db
app = Flask(__name__)
app.secret_key="abc"



@app.route('/',methods=['get','post'])
def login():
    if request.method=="POST":
        email=request.form['email']
        password=request.form['password']
        db=Db()
        ss=db.selectOne("select * from login where EMAIL='"+email+"' and PASSWORD='"+password+"'")
        if ss is not None:
            if ss['USER_TYPE']=='admin':
                return redirect("/adminhome")
            if ss['USER_TYPE']=='user':
                session['lid']=ss['id']
                return redirect('/userhome')
            if ss['USER_TYPE']=='waiting':
                return '''<script>alert("waiting for approval..");window.location="/"</script>'''
            if ss['USER_TYPE']=='store':
                session['lid'] = ss['id']
                return redirect('/storehome')
    return render_template('LOGIN.html')



@app.route('/adminhome')
def adminhome():
    return render_template('ADMIN/ADMINHOME.html')

@app.route('/userhome')
def userhome():
    return render_template('USER/USERHOME.html')

@app.route('/storehome')
def storehome():
    return render_template('STORE/storehome.html')


@app.route('/register',methods=['get','post'])
def register():
    if request.method=="POST":
       name=request.form['full_name']
       password = request.form['password']
       place=request.form['place']
       post=request.form['post']
       pin=request.form['pin']
       confirm_password = request.form['confirm_password']
       mobile_number = request.form['phone_num']
       email=request.form['email']
       db=Db()

       if password == confirm_password:
           db.insert("insert into login VALUES ('','" + email + "','" + password + "','user')")
           db.insert("insert into user_data values('','" + name + "','" + mobile_number + "','" + email + "','" + place + "','" + post + "','" + pin + "')")
           return '''<script>alert("registration success..");window.location="/"</script>'''
       else:
           return  '''<script>alert("Passwords doesn't match");window.location="/register"</script>'''
    else:
          return render_template('Register.html')


@app.route('/store_register',methods=['get','post'])
def store_register():
    if request.method=="POST":
        name=request.form['store_name']
        password = request.form['password']
        place = request.form['place']
        post = request.form['post']
        pin = request.form['pin']
        confirm_password = request.form['confirm_password']
        email = request.form['email']
        db=Db()
        if password == confirm_password:
            db.insert("insert into login VALUES ('','" + email + "','" + password + "','waiting')")
            db.insert( "insert into store values('','" + name + "','" + place + "','" + email + "','" + post + "','" + pin + "')")
            return '''<script>alert("waiting for approval...may take some time");window.location="/"</script>'''
        else:
            return '''<script>alert("Passwords doesn't match");window.location="/register"</script>'''
    else:
           return render_template('STORE/store_register.html')



@app.route('/store_approval')
def store_approval():
    db=Db()
    str="waiting"
    ss=db.select("select * from login WHERE USER_TYPE='"+str+"'")
    return render_template('ADMIN/STORE_APPROVAL.html',data=ss)



@app.route('/add_category',methods=['get','post'])
def add_category():
    if request.method == "POST":
        add_category=request.form['textfield']
        db=Db()
        db.insert("insert into category values('','"+add_category+"')")
        return "ok"
    return render_template('ADMIN/ADD_CATEGORY.html')






@app.route('/view_books')
def view_books():
    db=Db()
    ss=db.select("select * from book")

    return  render_template('ADMIN/BOOKS.html',data=ss)





@app.route('/view_complaint')
def view_complaint():
    db=Db()
    ss=db.select("select * from complaints")
    return render_template('ADMIN/COMPLAINTS.html',data=ss)





@app.route('/complaints_reply/<comp_id>',methods=['get','post'])
def complaints_reply(comp_id):
    if request.method=="POST":
     rep=request.form['comp_reply']
     db=Db()
     db.update("update complaints set Reply='"+rep+"',Reply_date=curdate() where Complaint_id='"+comp_id+"'")
     return '''<script>alert("reply send..");window.location="/view_complaint"</script>'''
    return render_template('ADMIN/COMPLAINT_REPLY.html')





@app.route('/view_feedback')
def view_feedback():
    db=Db()
    ss=db.select("select * from feedback")
    return render_template('ADMIN/FEEDBACK.html',data=ss)






@app.route('/view_store')
def view_store():
    db=Db()
    ss=db.select("select * from store")
    return render_template('ADMIN/STORE.html',data=ss)





@app.route('/view_users')
def view_users():
    db=Db()
    ss=db.select("select * from user_data")
    return render_template('ADMIN/VIEW_USERS.html',data=ss)




@app.route('/view_category')
def view_category():
    db = Db()
    ss = db.select("select * from category")
    return render_template('ADMIN/VIEW_CATEGORY.html',data=ss)





@app.route('/delete_category/<c_id>')
def delete_category(c_id):
    db = Db()
    ss = db.delete("delete from category where category_id='"+c_id+"'")
    return redirect('/view_category')

@app.route('/approve_req/<id>')
def approve_req(id):
    db=Db()
    db.update("update login set USER_TYPE='store' where id='"+id+"' ")
    return redirect('/store_approval')

# @app.route('/deny_req/<id>')
# def approve_req(id):
#     db=Db()
#     db.update('update login set USER_TYPE="store" where id='"+id+"'' )
#     return redirect('/store_approval')


@app.route('/categories')
def categories():
    db=Db()
    ss = db.select("select * from category")
    return render_template('USER/view_categories.html',data=ss)


@app.route('/Add_books',methods=['get','post'])
def Add_books():
    db = Db()
    ss = db.select("select * from category")
    if request.method=="POST":
        bookname=request.form['bookname']
        auther=request.form['auther']
        price=request.form['price']
        category=request.form['category']

        db.insert("insert into book values('','" + bookname + "','"+ auther +"','"+ price +"','"+category+"','"+str(session['lid'])+"')")
        return '''<script>alert("success..");window.location="/userhome"</script>'''

    return render_template('USER/Add_books.html',data=ss)




@app.route('/add_complaint',methods=['get','post'])
def add_complaint():
    db=Db()
    if request.method=="POST":
        complaint=request.form['complaint']
        db.insert("insert into complaints values('','"+str(session['lid'])+"','"+complaint+"','curdate()','','')")
        return '''<script>alert("success..");window.location="/userhome"</script>'''
    return render_template('USER/complaint.html')



@app.route('/add')
def add():
    return redirect('/add_category')


if __name__ == '__main__':
    app.run()
