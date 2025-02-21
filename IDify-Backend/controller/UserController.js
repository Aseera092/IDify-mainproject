const User=require("../model/User");
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { get } = require("mongoose");
const Admin = require("../model/Admin");
// const { homeLogin } = require("./HomeController");

const addUser=async(req,res,next)=>{
    try{
        const existingEmailUser = await User.findOne({ email: req.body.email });
        if (existingEmailUser) {
            return res.status(400).json({
                status: false,
                message: "Email already exists"
            });
        }
        const existingMobileUser = await User.findOne({ MobileNo: req.body.MobileNo });
        if (existingMobileUser) {
            return res.status(400).json({
                status: false,
                message: "Mobile Number already exists"
            });
        }
         const {password, ...homeLogin} = req.body;

        const user = new User(homeLogin);
        console.log(homeLogin);
        await user.save(); 
        const hashedPassword = await bcrypt.hash(password, 10);

        const userLogins = new Admin({
            userid: user.email,
            password: hashedPassword,
            isAdmin : false
        })
        await userLogins.save()

        res.status(201).json({
            status: true,
            message: "registered successfully",
            data: User 
        });
    } catch (error) {
        res.status(500).json({
            status: false,
            message: 'Error adding User',
            error: error.message
        });
    }
}

const getUser=async(req,res,next)=>{
    try{
        const user=await User.find();
        res.status(200).json({
            status:true,
            data:user
        });
    }
    catch(error){
        res.status(500).json({
            status:false,
            message:'Error fetching data',
            error:error.message
        });
    }
};
const updateUser=async(req,res,next)=>{
    try{
        const user=await User.findByIdAndUpdate(req.params.id,req.body,{new:true});
        if(!user){
            return res.status(404).json({
                status:false,
                message:"user not found"
            });
        }
        res.status(200).json({
            status: true,
            message: "User updated successfully",
            data: user 
        });
    }
 catch (error) {
    res.status(500).json({
        status: false,
        message: 'Error updating user data',
        error: error.message
    });
}
};

const deleteUser = async (req, res, next) => {
    try {
        const user = await User.findByIdAndDelete(req.params.id);

        if (!user) {
            return res.status(404).json({
                status: false,
                message: 'User not found'
            });
        }

        res.status(200).json({
            status: true,
            message: "User deleted successfully",
            data: User 
        });
    } catch (error) {
        res.status(500).json({
            status: false,
            message: 'Error deleting user',
            error: error.message
        });
    }
};

module.exports = { addUser,getUser,updateUser, deleteUser};