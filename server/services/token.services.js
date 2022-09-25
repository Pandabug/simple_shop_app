const jwt = require('jsonwebtoken');


module.exports = {
    generateTokens: (payload) => {
        const accessToken = jwt.sign(payload, process.env.JWT_ACCESS_SECRET, { expiresIn: process.env.JWT_ACCESS_TIME_LIFE });
        const refreshToken = jwt.sign(payload, process.env.JWT_REFRESH_SECRET, { expiresIn: process.env.JWT_REFRESH_TIME_LIFE });
        
        return {
            accessToken,
            refreshToken
        }
    },

    validateAccessToken: (token) => {
        try {
            const userData = jwt.verify(token, process.env.JWT_ACCESS_SECRET);

            return userData;
        } catch (e) {
            return null;
        }
    },

    validateRefreshToken: (token) => {
        try {
            const userData = jwt.verify(token, process.env.JWT_REFRESH_SECRET);

            return userData;
        } catch (e) {
            return null;
        }
    },

    generateTemporallyToken: (payload) => {
        const token = jwt.sign(payload, process.env.JWT_TEMPORALLY_SECRET, { expiresIn: process.env.JWT_TEMPORALLY_TIME_LIFE });

        return token;
    },

    validateTemporallyToken: (token) => {
        try {
            const userData = jwt.verify(token, process.env.JWT_TEMPORALLY_SECRET);

            return userData;
        } catch (e) {
            return null;
        }
    },
}