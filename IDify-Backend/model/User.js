const Mongoose=require("mongoose")
const UserSchema=Mongoose.Schema({
    // userid:{
    //     type:String,
    //     required:true,
    // },
   firstname:{
        type:String,
        required:true,
    },
    Lastname:{
        type:String,
        required:true,
    },
    email:{
        type:String,
        required:true,
        unique:true,
    },
    MobileNo:{
        type:Number,
        required:true,
        unique:true,
    },
    alternateMobileNo: {
        type: Number,
    },
    pindcode:{
        type:Number,
        required:true,
    },
    longitude:{
        type:Number,
        required:true,
        unique:true,
    },
    latitude:{
        type:Number,
        required:true,
        unique:true,
    },
    district:{
        type:String,
        required:true,
    },
    Country:{
        type:String,
        required:true,
    },
    upload_rationcard:{
        type:String,
        required:true,
    },
    status: {
        type: String,
        enum: ['online', 'offline'],
        default: 'online',
        required: true
    },
  
    // homedetails:{
    //     type:Mongoose.Schema.Types.ObjectId,
    //     ref:"home",
    // },
})
var UserModel=Mongoose.model("user",UserSchema)
module.exports=UserModel
