const Mongoose=require("mongoose")
const PanjayathSchema=Mongoose.Schema({
    email:
    {
        type:String,
        required:true
    },
    password:{
        type:String,
        required:true
    },
    name:
    {
        type:String,
        required:true
    },
    location:{
        type:String,
        required:true
    },
    status: {
        type: String,
        enum: ['online', 'offline', 'maintenance'], 
        default: 'online',
        required: true
      },
    // "name":String,
    "address":String,
    "district":String,
    "country":String,
})
var PanjayathModel=Mongoose.model("panjayath",PanjayathSchema)
module.exports=PanjayathModel