using {StoreManagement.db as firstdb} from '../db/Schema';

service PrdManagmentService{

    @odata.draft.enabled
    entity Products as projection on firstdb.Products{
        *,
        case 
            when stock = 0 then 'out of Stock'
            when stock < 10 then 'Low stock'
            else 'Available'
        end as status: String,

        case 
            when stock = 0 then '1'
            when stock < 10 then '2'
            else '3'
        end as statusCriticality: String
    }
    
}