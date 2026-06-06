namespace StoreManagement.db;
using { cuid,managed } from '@sap/cds/common';


entity Products:cuid{
    name : String(25);
    description : String(30);
    price: Decimal(9,2);
    discount: Integer;
    stock: Integer;
    image: LargeBinary @Core.MediaType: 'image/jpeg';
}

entity Orders:cuid,managed{
    customerName : String(30);
    customerMobile: String(10);
    storeName: String(30);
    netPrice: Decimal(9,2);
    items: Composition of  many OrderItems on items.order= $self;
}

entity OrderItems:cuid{
    order:Association to Orders;
    product: Association to Products;
    quantity: Integer;
    unitPrice: Decimal(9,2);
    stock:Integer;
    discount:Integer;
    totalPrice: Decimal(9,2);   
}