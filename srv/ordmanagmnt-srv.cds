using {StoreManagement.db as firstsdb} from '../db/Schema';

service OrderManagmntService{
    entity Products as projection on firstsdb.Products;
    @odata.draft.enabled
    entity Orders as projection on firstsdb.Orders;
    entity OrderItems as projection on firstsdb.OrderItems;
}