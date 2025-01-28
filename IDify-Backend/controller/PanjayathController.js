const Driver=require("../model/Panjayath");
const User=require("../model/User");
const bcrypt=require('bcryptjs');
const jwt=require('jsonwebtoken');
// const{database}=require("../util/mongodb");
const PanjayathModel = require("../model/Panjayath");

const addPanjayath = async (req, res, next) => {
    const { email } = req.body;

    if (!email) {
        return res.status(400).json({ status: false, error: "HomeId required" });
    }

    try {
        const existingPanjayath = await PanjayathModel.findOne({ email });
        if (existingPanjayath) {
            return res.status(400).json({
                status: false,
                error: `email '${email}' already exists. Please choose a different ID.`,
            });
        }

        const newpanjayath = new PanjayathModel(req.body);
        console.log(PanjayathModel);
        await newpanjayath.save();

        res.status(201).json({
            status: true,
            message: "Registered successfully",
            data: newpanjayath,
        });
    } catch (error) {
        console.log(error);
        return res.status(501).json({
            status: false,
            message: "Error saving HomeId",
            error: error.message,
        });
    }
}

const getPanjayath=async(req,res,next)=>{
    try{
        const email=await PanjayathModel.find();
        res.status(200).json({
            status:true,
            data:email
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
const updatePanjayath=async(req,res,next)=>{
    try{
        const panjayath=await PanjayathModel.findByIdAndUpdate(req.params.id,req.body,{new:true});
        if(!panjayath){
            return res.status(404).json({
                status:false,
                message:"user not found"
            });
        }
        res.status(200).json({
            status: true,
            message: "User updated successfully",
            data: panjayath 
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
const deletePanjayath = async (req, res, next) => {
    try {
        const panjayath = await PanjayathModel.findByIdAndDelete(req.params.id);

        if (!panjayath) {
            return res.status(404).json({
                status: false,
                message: 'Homeid not found'
            });
        }

        res.status(200).json({
            status: true,
            message: "homeid deleted successfully",
            data: panjayath 
        });
    } catch (error) {
        res.status(500).json({
            status: false,
            message: 'Error deleting user',
            error: error.message
        });
    }
};


const panjayathLogin = async (req, res) => {
        const { emailID, password } = req.body;
    
        try {
            const panjayath = await HomeModel.findOne({ emailID });
            
            if (!panjayath) return res.status(404).json({ error: 'panjayath not found' });
    
            const isMatch = await bcrypt.compare(password, emailID.password);
            if (!isMatch) return res.status(400).json({ error: 'Invalid credentials' });
    
            
            const token = jwt.sign({ emailID: home._id }, "nedumbasserypanjayath@gmail.com", { expiresIn: '1h' });
    
            res.status(200).json({status:true, token, message: 'Login successfulL' });
        } catch (err) {
            res.status(500).json({status:false, error: 'Login failed' });
            console.log(err);
            
        }
    };
module.exports = { addPanjayath,getPanjayath,updatePanjayath, deletePanjayath,panjayathLogin };