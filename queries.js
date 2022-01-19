const Pool = require("pg").Pool;
const pool = new Pool({
    user: 'sebiseb',
    host: 'localhost',
    database: 'sebiseb',
    password: 'Sest9777',
    port: 5432
})

const getCars = (req, res) => {
    pool.query('select * from Car', (error, results) =>{
        if(error){
            throw error;
        }else {
            res.status(200).send(results)
        }
    });
}

module.export = {
    getCars
}

