from flask import Flask, render_template, request,session,flash,url_for,redirect,current_app,make_response
from flask_sqlalchemy import SQLAlchemy 
import json,os,secrets
import werkzeug
werkzeug.cached_property = werkzeug.utils.cached_property
import pdfkit
import pymysql
import stripe
from datetime import datetime
from flask_login import LoginManager,login_required,current_user,logout_user,login_user,UserMixin
from flask_msearch import Search
from flask_bcrypt import Bcrypt
from flask_wtf.file import FileRequired,FileAllowed,FileField
from werkzeug.http import quote_etag
from flask_wtf import FlaskForm
from werkzeug.utils import format_string
from werkzeug.datastructures import FileStorage
from wtforms import Form,IntegerField,StringField,BooleanField,TextAreaField,validators ,FileField ,PasswordField,SubmitField,ValidationError
from flask_uploads import IMAGES,UploadSet,configure_uploads,patch_request_class
from werkzeug.utils import secure_filename
from flask_migrate import Migrate, edit
Publishable_key = "pk_test_51JtBNVSFLOkZfdqMagdwkOU7PCMke7XshQKWjjph1N5Hu0yz6fWJBgAdFlQlN5NF1WJDO1AdherBopRjgNAfsHiQ00eoeNLGt8"
stripe.api_key="sk_test_51JtBNVSFLOkZfdqM4QGudSpeSc42AyiTXki3pLdCFdwJ0mcGP7xHeUbT0S13PEHW9X5qb0oEnJJZJFnRVjWmNuvE00LkwapJUa"          


basedir=os.path.abspath(os.path.dirname(__file__))
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/pillaiscart'
app.config['SECRET_KEY']="JKSXHSJKHSKDYH4134"
app.config['UPLOADED_PHOTOS_DEST']=os.path.join(basedir,'static/img')
photos = UploadSet('photos', IMAGES)
configure_uploads(app,photos)
patch_request_class(app)

bcrypt = Bcrypt()
db = SQLAlchemy(app)
bcrypt=Bcrypt(app)
search=Search()
search.init_app(app)

migrate=Migrate(app,db)
with app.app_context():
    if db.engine.url.drivername =="sqlite":
        migrate.init_app(app,db,render_as_batch=True)
    else:
        migrate.init_app(app,db)

Login_Manager=LoginManager()
Login_Manager.init_app(app)
Login_Manager.login_view='customerLogin'
Login_Manager.needs_refresh_message_category='danger'
Login_Manager.login_message=u"Please Login first"

class Addproduct1(db.Model):
    __seachbale__=['name','discription']
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    price = db.Column(db.Numeric(10,2),  nullable=False)
    discount = db.Column(db.Integer, default=0)
    about = db.Column(db.String(500),nullable=False)
    discription = db.Column(db.String(500),nullable=False)
    color = db.Column(db.Text, nullable=False)
    size = db.Column(db.Text, nullable=False)


    brand_id = db.Column(db.Integer, db.ForeignKey('brand.id'),nullable=False)
    brand = db.relationship('Brand',backref=db.backref('brands', lazy=True))

    category_id = db.Column(db.Integer, db.ForeignKey('category.id'),nullable=False)
    category = db.relationship('Category',backref=db.backref('categories', lazy=True))

    image_1= db.Column(db.String(180), nullable=False,default='image.jpg')
    # image_2= db.Column(db.String(180), nullable=False,default='image.jpg')
    # image_3= db.Column(db.String(180), nullable=False,default='image.jpg')
    
    
    def __repr__(self):
        return '<Addproduct1 %r>' % self.name

@Login_Manager.user_loader
def user_loader(user_id):
    return Register.query.get(user_id)

class User(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    address = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(100),unique=False, nullable=False)
    phone_no = db.Column(db.String(120), unique=False, nullable=False)

    def __repr__(self):
        return '<User %r>' % self.name

    

  
class User_payment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120),nullable=False)
    amount = db.Column(db.String(120), nullable=False)



class Register(db.Model,UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False)
    email = db.Column(db.String(120), unique=True)
    address = db.Column(db.String(120), unique=False,default='none')
    password = db.Column(db.String(50),unique=False)
    contact = db.Column(db.String(120), unique=False)
    city = db.Column(db.String(120), unique=False,nullable=True,default='none')
    country = db.Column(db.String(120), unique=False,nullable=True,default='India')
    gender = db.Column(db.String(120), unique=False,default='none')
    pincode = db.Column(db.String(120), unique=False,default='none')
    profile= db.Column(db.String(180), nullable=False,default='profile1.jpg')
    date_created=db.Column(db.DateTime, nullable=False,default=datetime.utcnow)

    def __repr__(self):
        return '<Register %r>' % self.name


class Brand(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)

class Category(db.Model):
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)


        
class JsonEcodeDict(db.TypeDecorator):
    impl=db.Text

    def process_bind_param(self,value,dialect):
        if value is None:
            return '{}'

        else:
            return json.dumps(value)

    def process_result_value(self,value,dialect):
        if value is None:
            return {}
        else:
            return json.loads(value)

class CustomerOrder(db.Model):
    id = db.Column(db.Integer,primary_key=True )
    customer_id= db.Column(db.Integer,nullable=False, unique=False)
    invoice = db.Column(db.String(50), nullable=False, unique=True)
    status = db.Column(db.String(20), nullable=False,default='Pending')
    date_created=db.Column(db.DateTime, nullable=False,default=datetime.utcnow)
    orders = db.Column(JsonEcodeDict)

    def __repr__(self):
        return '<CustomerOrder %r>' % self.invoice


# forms

class CustomerFrom(Form):
    name = StringField('Name', [ validators.DataRequired()])
    email = StringField('Email Address', [validators.Email(),validators.Length(min=6, max=35),validators.DataRequired()])
    address = StringField('Address')
    contact = StringField('contact', [validators.Length(min=10, max=12),validators.DataRequired()])
    gender = StringField('gender')
    pincode = StringField('pincode')
    city = StringField('city')

    profile=FileField('Profile',validators=[FileAllowed(['jpg','png','gif','jpeg','webp' ])])

    password = PasswordField('New Password', [
        validators.DataRequired(),validators.Length(min=8, max=20),
        validators.EqualTo('confirm', message='Passwords must match')
    ])
    confirm = PasswordField('Repeat Password')

def  validate_email(self,email):
    if Register.query.filter_by(email=email.data).first():
        raise ValidationError("This email address is already in use !")



class CustomerLoginFrom(FlaskForm):
    email = StringField('Email Address',[ validators.DataRequired()])
    password = PasswordField('Password :',[validators.DataRequired()])

    
class RegistrationForm(Form):
    name = StringField('Name', [ validators.DataRequired()])
    email = StringField('Email Address', [validators.Email(),validators.Length(min=6, max=35),validators.DataRequired()])
    address = StringField('Address', [validators.Length(min=5, max=200),validators.DataRequired()])
    phone_no = StringField('Phone_no', [validators.Length(min=10, max=12),validators.DataRequired()])

    password = PasswordField('New Password', [
        validators.DataRequired(),validators.Length(min=8, max=20),
        validators.EqualTo('confirm', message='Passwords must match')
    ])
    confirm = PasswordField('Repeat Password')

def  validate_email(self,email):
    if Register.query.filter_by(email=email.data).first():
        raise ValidationError("This email address is already in use !")

class LoginForm(Form):
    email = StringField('Email Address', [validators.Length(min=6, max=35)])
    password = PasswordField('password', [validators.DataRequired()])

class Addproducts(Form):
    name = StringField('Name', [validators.DataRequired()])
    price = IntegerField('Price', [validators.DataRequired()])
    discount =IntegerField('Discount', [validators.DataRequired()])
    discription =StringField('Discription', [validators.DataRequired()])
    about =StringField('About', [validators.DataRequired()])
    id = IntegerField('id', [validators.DataRequired()])
    color = StringField('Color', [validators.DataRequired()])
    size = StringField('Size', [validators.DataRequired()])


    image_1=FileField('Image_1',validators=[FileAllowed(['jpg','png','gif','jpeg','webp'])])
    # image_2=FileField('Image_2',validators=[FileAllowed(['jpg','png','gif','jpeg','webp'])])
    # image_3=FileField('Image_3',validators=[FileAllowed(['jpg','png','gif','jpeg','webp'])])


@app.route('/Admin/1360')
def Admin():
    if 'email' not in session:
        flash("please login first",'danger')
        return redirect(url_for('login'))
    products=Addproduct1.query.all()
    return render_template('admin.html',products=products)

@app.route('/Addproduct', methods = ['GET', 'POST'])
def Addproduct():
    brands=Brand.query.all()
    categories=Category.query.all()
    form =Addproducts(request.form)
    if request.method=="POST":
        name=form.name.data
        price=form.price.data
        discount=form.discount.data
        id=form.id.data
        color=form.color.data
        size=form.size.data
        discription=form.discription
        about=form.about.data
        brand=request.form.get('brand')
        category=request.form.get('category')
        image_1=photos.save(request.files.get('image_1'),name=secrets.token_hex(10) + ".")
        # image_2=photos.save(request.files.get('image_2'),name=secrets.token_hex(10) + ".")
        # image_3=photos.save(request.files.get('image_3'),name=secrets.token_hex(10) + ".")
        addpro=Addproduct1(name=name,price=price,discount=discount,id=id,discription=discription,
        color=color,brand_id=brand,category_id=category,image_1=image_1,size=size,about=about)
        db.session.add(addpro)
        db.session.commit()
        flash(f'The product {name} has been added to your database',"success")
        return redirect(url_for('Admin'))
    return render_template('addproduct.html',form=form,brands=brands,categories=categories)


@app.route('/editprofile/<int:id>', methods = ['GET', 'POST'])
def editprofile(id):
    edit=Register.query.get_or_404(id)
    form=CustomerFrom(request.form)
    if request.method=="POST":
        edit.name=form.name.data
        edit.email=form.email.data
        edit.gender=form.gender.data
        edit.contact=form.contact.data
        edit.address=form.address.data
        edit.pincode=form.pincode.data
        edit.city=form.city.data




        if request.files.get("profile"):
                try:
                    os.unlink(os.path.join(current_app.root_path ,"static/img/"+edit.profile))
                    edit.profile=photos.save(request.files.get('profile'),name=secrets.token_hex(10) + ".")
                except:
                    edit.profile=photos.save(request.files.get('profile'),name=secrets.token_hex(10) + ".")

        db.session.commit()
        return redirect(url_for('profile'))


    form.name.data=edit.name
    form.email.data=edit.email
    form.contact.data=edit.contact
    form.gender.data=edit.gender
    form.address.data=edit.address
    form.pincode.data=edit.pincode
    form.city.data=edit.city




    return render_template('editprofile.html',edit=edit,form=form)





@app.route('/updateproduct/<int:id>', methods = ['GET', 'POST'])
def updateproduct(id):
    brands=Brand.query.all()
    categories=Category.query.all()
    product=Addproduct1.query.get_or_404(id)
    brand=request.form.get('brand')
    category=request.form.get("category")
    form=Addproducts(request.form)
    if request.method=="POST":
        product.name=form.name.data
        product.price=form.price.data
        product.discription=form.discription.data
        product.about=form.about.data
        product.discount=form.discount.data
        product.color=form.color.data
        product.size=form.size.data
        product.id=form.id.data
        product.brand_id=brand
        product.category_id=category
        if request.files.get("image_1"):
            try:
                os.unlink(os.path.join(current_app.root_path ,"static/img/"+product.image_1))
                product.image_1=photos.save(request.files.get('image_1'),name=secrets.token_hex(10) + ".")
            except:
                product.image_1=photos.save(request.files.get('image_1'),name=secrets.token_hex(10) + ".")
        if request.files.get("image_2"):
            try:
                os.unlink(os.path.join(current_app.root_path ,"static/img/"+product.image_2))
                product.image_2=photos.save(request.files.get('image_2'),name=secrets.token_hex(10) + ".")
            except:
                product.image_2=photos.save(request.files.get('image_2'),name=secrets.token_hex(10) + ".")

        if request.files.get("image_3"):
            try:
                os.unlink(os.path.join(current_app.root_path ,"static/img/"+product.image_3))
                product.image_3=photos.save(request.files.get('image_3'),name=secrets.token_hex(10) + ".")
            except:
                product.image_3=photos.save(request.files.get('image_3'),name=secrets.token_hex(10) + ".")



        db.session.commit()
        flash(f"Your product is updated succesfully","success")
        return redirect(url_for('Admin'))

    form.name.data=product.name
    form.price.data=product.price
    form.discription.data=product.discription
    form.about.data=product.about
    form.discount.data=product.discount
    form.color.data=product.color
    form.size.data=product.size
    form.id.data=product.id
    return render_template('updateproduct.html',form=form,brands=brands,categories=categories,product=product,brand=brand,category=category)

@app.route('/deleteproduct/<int:id>', methods = ['POST'])
def deleteproduct(id):
    product=Addproduct1.query.get_or_404(id)
    if request.method=="POST":
        db.session.delete(product)
        db.session.commit()
        flash(f"The product {product.name} was deleted from your database","success")
        return redirect(url_for('Admin'))
    



@app.route('/brands')
def brands():
    if 'email' not in session:
        flash("please login first",'danger')
        return redirect(url_for('login'))
    brands=Brand.query.order_by(Brand.id.desc()).all()
    return render_template('brand.html',brands=brands)


@app.route('/updatebrand/<int:id>',methods = ['GET', 'POST'])
def updatebrand(id):
    if 'email' not in session:
        flash("please login first",'danger')
        
    updatebrand=Brand.query.get_or_404(id)
    brand=request.form.get('brand')
    if request.method=="POST":
        updatebrand.name=brand
        db.session.commit() 
        flash("Your brand has been updated successfully",'success')
        return redirect(url_for('brands'))
    return render_template('updatebrand.html',updatebrand=updatebrand)



@app.route('/deletebrand/<int:id>', methods = ['POST'])
def deletebrand(id):
    brand=Brand.query.get_or_404(id)
    if request.method=="POST":
        db.session.delete(brand)
        db.session.commit()
        flash(f"The brand {brand.name} was deleted from your database","success")
        return redirect(url_for('brands'))
  
@app.route('/brand/<int:id>')
def get_brand(id):  
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brand=Addproduct1.query.filter_by(brand_id=id)
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    return render_template('product1.html',brand=brand,brands1=brands1,categories=categories)

    
@app.route('/categories/<int:id>')
def get_category(id):  
    get_cat_pr=Addproduct1.query.filter_by(category_id=id)
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    return render_template('product1.html',get_cat_pr=get_cat_pr,categories=categories,brands1=brands1)

@app.route('/category')
def categories():
    if 'email' not in session:
        flash("please login first",'danger')
        return redirect(url_for('login')) 
    categories=Category.query.order_by(Category.id.desc()).all()
    return render_template('category.html',categories=categories)

@app.route('/user')
def userd():
    if 'email' not in session:
        flash("please login first",'danger')
        return redirect(url_for('login')) 
    userd=Register.query.all()
    return render_template('user.html',userd=userd)

@app.route("/addbrand", methods = ['GET', 'POST'])
def addbrand():
    if 'email' not in session:
        flash("please login first",'danger')
    
    if request.method=="POST":
        getbrand=request.form.get("brand")
        brand=Brand(name=getbrand)
        db.session.add(brand)
        db.session.commit()
        flash(f'The Brand {getbrand} was added to your database ','success')
        return redirect(url_for('brands'))
    return render_template('addbrand.html',brands='brands')

@app.route("/addcat", methods = ['GET', 'POST'])
def addcat():
    if 'email' not in session:
        flash("please login first",'danger')
    if request.method=="POST":
        getcat=request.form.get("category")
        category=Category(name=getcat)
        db.session.add(category)
        db.session.commit()
        flash(f'The Category {getcat} was added to your database ','success')
        return redirect(url_for('categories'))
    return render_template('addcat.html',categories='categories')
         

@app.route('/updatecat/<int:id>',methods = ['GET', 'POST'])
def updatecat(id):
    if 'email' not in session:
        flash("please login first",'danger')
    updatecat=Category.query.get_or_404(id)
    category=request.form.get('category')
    if request.method=="POST":
        updatecat.name=category
        flash("Your category has been updated successfully",'success')
        db.session.commit() 
        return redirect(url_for('categories'))
    return render_template('updatebrand.html',updatecat=updatecat)

@app.route('/deletecategory/<int:id>', methods = ['POST'])
def deletecategory(id):
    category=Category.query.get_or_404(id)
    if request.method=="POST":
        db.session.delete(category)
        db.session.commit()
        flash(f"The category {category.name} was deleted from your database","success")
        return redirect(url_for('categories'))
    

@app.route('/')
def home():
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    products=Addproduct1.query.all()
    return render_template('index.html',products=products,brands1=brands1,categories=categories)

    
@app.route('/home')
def home1():
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    products=Addproduct1.query.all()
    return render_template('product1.html',products=products,brands1=brands1,categories=categories)

@app.route('/result')
def result():
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    searchword=request.args.get('q')
    products=Addproduct1.query.msearch(searchword,fields=['name','discription'],limit=20)
    return render_template('result.html',products=products,categories=categories,brands1=brands1)

@app.route('/register',methods = ['GET', 'POST'])
def Customer_register():
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    form = CustomerFrom(request.form)
    if request.method=='POST'and form.validate():
        if Register.query.filter_by(email=form.email.data).first():
            flash(f'{form.name.data} You are already registered!, Try to login',"danger")
            return redirect(url_for('customerLogin'))
        else:
            # hash_password=bcrypt.generate_password_hash(form.password.data)
            register =Register(name=form.name.data, email=form.email.data,contact=form.contact.data,address=form.address.data,
                        password=form.password.data,gender=form.gender.data,pincode=form.pincode.data)
            db.session.add(register)
            flash(f'welcome {form.name.data}, Thank you for registering',"success")
            db.session.commit() 
            return redirect(url_for('home'))
    return render_template('register1.html', form=form,brands1=brands1,categories=categories)


@app.route('/Customerlogin',methods = ['GET', 'POST'])
def customerLogin():
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    form = CustomerLoginFrom()
    if request.method=="POST":
        user=Register.query.filter_by(email=form.email.data).first()
        if user and user.password==form.password.data:
            login_user(user)
            flash('Your are loggin now ','success')
            next=request.args.get('next')
            return redirect(next or url_for('home'))
        else:

            flash("incorrect Email or password ","danger")
        return redirect(url_for('customerLogin'))

    return render_template('login3.html',form=form,brands1=brands1 ,categories=categories)


@app.route('/Cumstomerlogout',methods = ['GET', 'POST'])
def customer_logout():
    logout_user()
    session.pop('Shoppingcart',None)
    return redirect(url_for(('customerLogin')))


def updateshoppingcart():
    for key ,product in session['Shoppingcart'].items():
        session.modified=True
        del product['image']
        del product['colors']
    return updateshoppingcart

@app.route('/profile')
@login_required
def profile():
    
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    # categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    # brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    return render_template('profile.html',profile=profile,categories=categories,brands1=brands1)

@app.route('/myorders')
@login_required
def myorders():
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    if current_user.is_authenticated:
        grandTotal=0
        subTotal=0
        customer_id=current_user.id
        customer=Register.query.filter_by(id=customer_id).first()
        orders=CustomerOrder.query.filter_by(customer_id=customer_id).order_by(CustomerOrder.id.desc()).first()
        if orders:
            for key ,product in orders.orders.items() :
                discount=(product['discount']/100)*float(product['price'])
                subTotal+=float(product['price'])*int(product['quantity'])
                subTotal-=discount*int(product["quantity"])
                tax=("%2f" %(.06*float(subTotal)))
                grandTotal=("%.2f" % (1.06*float(subTotal)))

        
        else:
            return render_template('sorry.html',categories=categories,brands1=brands1)
    else:
        return redirect(url_for('customerLogin'))
    return render_template('myorders.html',tax=tax,grandTotal=grandTotal
    ,customer=customer,subTotal=subTotal,orders=orders,categories=categories,brands1=brands1)

@app.route('/myordersd')
@login_required
def myorders1():
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()        
    return render_template('myorders1.html',categories=categories,brands1=brands1)


@app.route('/getorder')
def get_order():
    if "Shoppingcart" in session:
        if current_user.is_authenticated :
            customer_id=current_user.id
            invoice=secrets.token_hex(5)
            updateshoppingcart()

            try:
                order=CustomerOrder(invoice=invoice,customer_id=customer_id,orders=session["Shoppingcart"])
                db.session.add(order)
                db.session.commit()

                session.pop('Shoppingcart')
                return redirect(url_for('orders',invoice=invoice))
            except Exception as e:
                print(e)
                flash("Some thing went wrong","danger")
                return redirect(url_for('getCart'))

    else:
        return render_template('sorry1.html')

@app.route('/orders/<invoice>')
@login_required
def orders(invoice):
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    if current_user.is_authenticated:
        grandTotal=0
        subTotal=0
        customer_id=current_user.id
        customer=Register.query.filter_by(id=customer_id).first()
        orders=CustomerOrder.query.filter_by(customer_id=customer_id).order_by(CustomerOrder.id.desc()).first()
        for key ,product in orders.orders.items():
            discount=(product['discount']/100)*float(product['price'])
            subTotal+=float(product['price'])*int(product['quantity'])
            subTotal-=discount
            tax=("%2f" %(.06*float(subTotal)))
            grandTotal=("%.2f" % (1.06*float(subTotal)))
    else:
        return redirect(url_for('customerLogin'))
    return render_template('order.html',invoice=invoice,tax=tax,grandTotal=grandTotal
    ,customer=customer,subTotal=subTotal,orders=orders,categories=categories,brands1=brands1)


@app.route('/payment', methods=['POST'])
def payment():
    invoice=request.form.get('invoice')
    amount=request.form.get('amount')
    customer = stripe.Customer.create(
        email=request.form['stripeEmail'],
        source=request.form['stripeToken'],
    )

    charge = stripe.Charge.create(
        customer=customer.id,
        description="Pillai's cart ",
        amount=amount,
        currency='INR',
    )
    orders=CustomerOrder.query.filter_by(customer_id=current_user.id,invoice=invoice).order_by(CustomerOrder.id.desc()).first()
    orders.status='Paid'
    db.session.commit()
    return redirect(url_for('thanks'))


@app.route('/sorry')
def sorry():
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    return render_template('sorry.html',categories=categories,brands1=brands1)
    
@app.route('/sorry1')
def sorry1():
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    return render_template('sorry1.html',categories=categories,brands1=brands1)


@app.route('/thanks')
def thanks():
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    return render_template('thank.html',categories=categories,brands1=brands1)

@app.route('/get_pdf/<invoice>', methods=['GET','POST'])
def get_pdf(invoice):
    if current_user.is_authenticated:
        grandTotal=0
        subTotal=0
        customer_id=current_user.id
        if request.method=="POST":
            customer=Register.query.filter_by(id=customer_id).first()
            orders=CustomerOrder.query.filter_by(customer_id=customer_id).order_by(CustomerOrder.id.desc()).first()
            for key ,product in orders.orders.items():
                discount=(product['discount']/100)*float(product['price'])
                subTotal+=float(product['price'])*int(product['quantity'])
                subTotal-=discount
                tax=("%2f" %(.06*float(subTotal)))
                grandTotal=float("%.2f" % (1.06*subTotal))

            rendered= render_template('pdf.html',invoice=invoice,tax=tax,grandTotal=grandTotal
            ,customer=customer,subTotal=subTotal,orders=orders)
            pdf=pdfkit.from_string(rendered,False)
            response=make_response(pdf)
            response.headers['content-Type']='application/pdf'
            response.headers['content-Disposition']='inline: filename='+invoice+'.pdf'
            return response
    return request(url_for('orders'))

@app.route('/signup', methods=['GET', 'POST'])
def register():
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    form = RegistrationForm(request.form)
    if request.method=='POST'and form.validate():
        user =User(name=form.name.data, email=form.email.data,phone_no=form.phone_no.data,address=form.address.data,
                    password=form.password.data)
        db.session.add(user)
        flash(f'welcome {form.name.data}, Thank you for registering',"success")
        db.session.commit() 

        return redirect(url_for('home'))
    return render_template('register.html', form=form,brands1=brands1,categories=categories)


@app.route("/login", methods = ['GET', 'POST'])
def login():
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    form = LoginForm(request.form)
    if request.method=='POST':
        user=User.query.filter_by(email=form.email.data).first()
        if user:
            session['email']=form.email.data
            flash(f'Welcome {form.email.data} you are login now','success')
            return redirect(request.args.get('next') or url_for('Admin'))
            
        else:
            flash(f'wrong Password please try again','danger')
        
    return render_template('login1.html',form=form,brands1=brands1,categories=categories)
  

def MagerDicts(dict1,dict2):
    if isinstance(dict1,list) and isinstance(dict2,list):
        return dict1 + dict2
    elif isinstance(dict1,dict) and isinstance(dict2,dict):
        return dict(list(dict1.items()) + list(dict2.items()))
    return False

@app.route('/productd/<int:id>')
def product_page(id):
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    product=Addproduct1.query.get_or_404(id)
    return render_template('pdetail.html',product=product,brands1=brands1,categories=categories)

            
@app.route('/addcart', methods=['GET','POST'])
@login_required
def Addcart():
    try:
        product_id =request.form.get('product_id')
        quantity=int(request.form.get('quantity'))
        colors=request.form.get('colors')
        sizes=request.form.get('sizes')
        product=Addproduct1.query.filter_by(id=product_id).first()

        if request.method =="POST":
            DictItems={product_id:{'name': product.name,"price":product.price,'discount':product.discount,"color":colors,"size":sizes,
                                    'quantity':quantity,'image':product.image_1,'colors':product.color,'sizes':product.size}}
            if "Shoppingcart" in session:
                print(session["Shoppingcart"])
                if product_id in session['Shoppingcart']:
                    for key ,item in session['Shoppingcart'].items():
                        if int(key) == int (product_id):
                            session.modified = True
                            item['quantity'] +=1
                    
                else:
                    session['Shoppingcart']=MagerDicts(session['Shoppingcart'],DictItems)
                    return redirect(request.referrer)


            else:
                session['Shoppingcart']=DictItems
                return redirect(request.referrer)
    except Exception as e:
        print(e)
    finally:
        return redirect(request.referrer)


@app.route("/carts")
@login_required
def getCart():
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    if "Shoppingcart" not in session or len(session['Shoppingcart']) <=0:
        return redirect(url_for('sorry1'))
    subtotal=0
    grandtotal=0
    for key, product in session['Shoppingcart'].items():
        discount=(product['discount']/100)*float(product['price'])
        subtotal += float(product['price']) * int(product["quantity"])
        subtotal-=discount*int(product["quantity"])
        tax=("%.2f" % (.06 * float(subtotal)))
        grandtotal=float("%.2f" % (1.06 * subtotal))
    return render_template('carts.html',tax=tax,grandtotal=grandtotal,brands1=brands1,categories=categories)


@app.route('/updatecart/<int:code>', methods=['POST'])
def updatecart(code):
    if 'Shoppingcart' not in session and len(session['Shoppingcart'])<=0:
        return redirect(url_for('home'))
    if request.method=="POST":
        quantity= request.form.get("quantity")
        color= request.form.get("color")
        size= request.form.get("size")

        try:
            session.modified=True
            for key , item in session['Shoppingcart'].items():
                if int (key) ==code:
                    item["quantity"]=quantity
                    item['color']=color
                    item['size']=size

                    # flash('Item is updated successfully !','success')
                    return redirect(url_for('getCart'))
        except Exception as e:
            print(e)
            return redirect(url_for('getCart'))


@app.route('/deleteitem/<int:id>')
def deleteitem(id):
    if 'Shoppingcart' not in session and len(session['Shoppingcart'])<=0:
        return redirect(url_for('home'))
    try:
        session.modified=True
        for key , item in session['Shoppingcart'].items():
            if int (key) ==id:
                session["Shoppingcart"].pop(key,None)
                # flash('Item is deleted successfully !','success')
                return redirect(url_for('getCart'))
    except Exception as e:
        print(e)
    return redirect(url_for('getCart'))


@app.route("/clearcart")
def clearcart():
    try:
        session.pop('Shoppingcart',None)
        return redirect(url_for('home'))
    except Exception as e:
        print(e)
    
@app.route('/contact')
def contact():
    brands1=Brand.query.join(Addproduct1,(Brand.id==Addproduct1.brand_id)).all()
    categories=Category.query.join(Addproduct1,(Category.id==Addproduct1.category_id)).all()
    return render_template('contact.html',brands1=brands1,categories=categories)

    
if __name__ == '__main__':
    app.run(debug=True)