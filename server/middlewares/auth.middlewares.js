const tokenServices = require('../services/token.services');


module.exports = function (req, res, next) {
    try {
        const authorizationHeader = req.headers.authorization;

        if (!authorizationHeader)
            return res.status(401).json({ message: 'No authorization in header!' });

        const accessToken = authorizationHeader.split(' ')[1];
        if (!accessToken)
            return res.status(401).json({ message: 'Inccorrect header access token!' });

        const userData = tokenServices.validateAccessToken(accessToken);
        if (!userData)
            return res.status(401).json({ message: 'Token expired!' });

        req.user = userData;
        req.token = accessToken;
        next();
    } catch {
        next(res.status(401).json({ message: 'Authorization error!' }));
    }
}