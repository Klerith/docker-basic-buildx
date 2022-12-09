const { syncDB } = require('../../tasks/sync-db');


describe('Pruebas en Sync-DB', () => { 
    
    test('debe de ejecutar el proceso 2 veces', () => {
        
        syncDB();
        const times = syncDB();
        expect( times ).toBe( 2 );
        
    });


});

