const cron = require('node-cron');
const { syncDB } = require('./tasks/sync-db');

console.log('Inicio de la app');


cron.schedule('1-59/5 * * * * *', syncDB );
