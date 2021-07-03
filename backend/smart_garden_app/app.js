const express = require('express')
const mongoose = require('mongoose')

const app = express()
app.use(express.json())
app.use(express.urlencoded())

//connection
mongoose.connect("mongodb://localhost:27017/smartGardenDB", {useNewUrlParser: true , useUnifiedTopology: true})

//defining schema
const userSchema = new mongoose.Schema({
    name:{
        type: String,
        required: [true, "name shoudn't be empty"]
    },
    username: {
        type: String,
        required: [true, "username shoudn't be empty"]
    },
    email:{
        type: String,
        required: [true, "email shoudn't be empty"]
    },
    password:{
        type: String,
        required: [true, "password shoudn't be empty"]
    },
    role:{
        type: String,
        required: [true, "role shoudn't be empty"]
    }
})

//model
const User = mongoose.model("User", userSchema)






app.post('/signup', function(req,res){
    const Name = req.body.name
    const Username = req.body.username
    const Email = req.body.email
    const Password = req.body.password
    const Role = req.body.role
    console.log("Hey, i'm here")
    // const u = new User({
    //     name:Name,
    //     username:Username,
    //     email:Email,
    //     password: Password,
    //     role: Role
    // });
    // u.save()
    // res.end()
    let errors={}
    User.findOne({username: Username}, function(err, usrname){
        if(!usrname){
            User.findOne({email:Email}, function(err,eml){
                if(!eml){
                    //insertion
                    const u = new User({
                        name:Name,
                        username:Username,
                        email:Email,
                        password: Password,
                        role: Role
                    });
                    console.log('hello, svaing')
                    u.save()
                    return res.status(201).json({message: 'User added successfully'})
                }
                else{
                    console.log('Email already exist!')
                    // errors.email="Email already exist!"
                    return res.status(400).json({message: 'email already exist'})
                    // res.end()
                }
            })
            
        }
        else{
            //show username already exist
            console.log('username already exist!')
            // errors.username="username already exist"
            return res.status(400).json({message:'username already exist'})
            // res.end()
        }

    })
    .catch(err=>{
        return res.status(500).json({
            error:err
        })
    })

})



app.listen(3000,function(){
    console.log("server is running on port 3000.");
});
