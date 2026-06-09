const cds = require('@sap/cds');
const { INSERT, UPDATE } = require('@sap/cds/lib/ql/cds-ql');
const { results } = require('@sap/cds/lib/utils/cds-utils');

module.exports = class PrdManagmentService extends cds.ApplicationService{

    init(){

       const{Products} =  cds.entities("PrdManagmentService")

    //    this.on('CREATE',Products,async req =>{
    //     console.log('On handler')
    //       await INSERT.into('Products').entries(req.data);
    //    })

       this.before('CREATE',Products,async req =>{
        console.log('Before handler')
            if(req.data.discount === null){
                req.data.discount = 0;
            }
       })

    //    this.after('READ',Products, results =>{
    //         console.log('After handler')
    //         for(let i=0;i<results.length;i++){
    //             const discount = results[i].discount;
    //             const price = results[i].price;
    //             const priceAfterDiscount = (100-discount)*price;
    //         results[i].discount = priceAfterDiscount;
    //         }
            
    //    })

        this.on('addStock',async req =>{
            const prdId = req.params[0].ID;
            const newStock = req.data.stock
            await UPDATE('Products').set({stock:{'+=' :newStock}}).where({ID:prdId});
            req.info('stock '+newStock+ ' added successfully')
        })

        this.on('applyDiscount',async req =>{
            const discount = req.data.discount;
            const prdId = req.params[0].ID;
            await UPDATE('Products').set({discount:discount}).where({ID:prdId})
            req.info('Discount of ' +discount+ ' %added successfully')
            
        })



        return super.init();

    }
}