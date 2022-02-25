use firstdB

db.createcollection('Edutech')

db.Edutech.insertMany([{ 
        'admin':'Rick',
        'session':'mongo',
        'assignments':'useInsertMany'
       }, 
        {
            'admin':'Morty', 
            'session':'Sci-fi',
            'assignments':'loopHoles'
        },   
     { 
        'admin':'Steve', 
        'session':'Portals', 
        'assignments':'Unknown' }])

/* wont work

 db.Edutech.updateMany({admin:'Rick'},{admin:'Steve'}, 
{ 'admin':'UpdatedRick', 'session':'mongoNew', 'assignments':'updateMany' },
 { 'admin':'UpdatedSteve', 'session':'portalsNew', 'assignments':'NewUnknown' })
*/

db.createcollection('Edtec')


db.Edtec.insertMany([{ 
        'admin':'Rick',
        'session':'mongo',
        'assignments':'1'
       }, 
        {
            'admin':'Morty', 
            'session':'Sci-fi',
            'assignments':'1'
        },   
     { 
        'admin':'Steve', 
        'session':'Portals', 
        'assignments':'1' }])

/*
db.(collectionName).updateMany({#uniqueIdentifier},{#dataChange})
*/
db.Edtec.updateMany({assignments:'1'},{$set:{assignment:'2'}})
db.Edtec.deleteMany({})
