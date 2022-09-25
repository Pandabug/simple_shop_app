const bcrypt = require('bcrypt');

const tokenServices = require('../services/token.services');

const userModel = require("../models/user.model");

const UserDto = require('../dtos/userDto');


module.exports = {
    login: async (req, res) => {
        try {
            const { email, password } = req.body;

            const user = await userModel.findOne({ email: email });
            if (!user)
                return res.status(400).json({ message: 'User not found!' });
            
            const validatePassword = bcrypt.compareSync(password, user.password);
            if (!validatePassword)
                return res.status(400).json({ message: 'Incorrect password!' });
            
            const userDto = new UserDto(user);
            const tokens = tokenServices.generateTokens({...userDto});

            res.status(200).json({ ...tokens, user: userDto });
        } catch (e) {
            res.status(400).json({ message: 'Login error!' });
        }
    },

    signup: async (req, res) => {
        try {
            const { email, password, image } = req.body;

            const candidate = await userModel.findOne({ email: email });
            if (candidate)
                return res.status(400).json({ message: `"${email}" is already in use!` });

            const hashPassword = bcrypt.hashSync(password, 7);
        
            const user = new userModel({ email: email, password: hashPassword, image: image });
            await user.save();

            res.status(200).json({ message: 'Success signup!' });
        } catch (e) {
            res.status(400).json({ message: 'Signup error!' });
        }
    },

    profile: async (req, res) => {
        try {
            const user = await userModel.findById(req.user.id);
            if (!user)
                return res.status(400).json({ message: 'User not found!' });

            const userDto = new UserDto(user);
            const tokens = tokenServices.generateTokens({...userDto});

            res.status(200).json({ ...user._doc, ...tokens });
        } catch (e) {
            res.status(400).json({ message: 'Profile error!' });
        }
    },
}