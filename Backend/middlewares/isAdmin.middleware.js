import { User } from "../Models/user.model.js";

export const isAdmin = async (req, res, next) =>{
    try {
        const {userId} = req.body;
        
        if(!userId){
            return res.status(400).json({
                message : "User id is required",
                success : false,
            });
        }
        const user = await User.findById(userId);
        if(!user || !user.isAdmin){
            return res.status(403).json({
                message : "Access denied. Admins only",
                success : false,
            });
        }
        next();
    } catch(err){
        console.log(err);
        return res.status(500).json({
            message : "Server problem",
            success : false,
        });
    }
}