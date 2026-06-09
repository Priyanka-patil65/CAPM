using OrderManagmntService as service from '../../srv/ordmanagmnt-srv';
annotate service.Orders with @(
    UI.SelectionFields : [
        ID,
        customerName,
        netPrice,
        storeName,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : customerName,
        },
        {
            $Type : 'UI.DataField',
            Value : storeName,
        },
        {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    ],
    UI.HeaderInfo : {
        TypeName : 'Order',
        TypeNamePlural : 'Orders',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    },
    UI.DataPoint #createdBy : {
        $Type : 'UI.DataPointType',
        Value : createdBy,
        Title : 'createdBy',
    },
    UI.DataPoint #storeName : {
        $Type : 'UI.DataPointType',
        Value : storeName,
        Title : 'storeName',
    },
    UI.DataPoint #customerName : {
        $Type : 'UI.DataPointType',
        Value : customerName,
        Title : 'customerName',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'createdBy',
            Target : '@UI.DataPoint#createdBy',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'storeName',
            Target : '@UI.DataPoint#storeName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'customerName',
            Target : '@UI.DataPoint#customerName',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Details',
            ID : 'OrderDetails',
            Target : '@UI.FieldGroup#OrderDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            ID : 'ItemDetails',
            Target : 'items/@UI.LineItem#ItemDetails',
        },
    ],
    UI.FieldGroup #OrderDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerMobile,
                Label : 'customerMobile',
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
        ],
    },
);

annotate service.Orders with {
    ID @Common.Label : 'OrderID';
    customerName @Common.Label : 'CustomerName';
    netPrice @Common.Label : 'NetPrice';
    storeName @Common.Label : 'StoreName';

};


annotate service.OrderItems with @(
    UI.LineItem #ItemDetails : [
        {
            $Type : 'UI.DataField',
            Value : order_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
        },
    ],
);

annotate service.OrderItems with{
    ID @Common.Label : 'Item Id';
    order @Common.Label : 'Order_Id';
    product @(
        Common.Label : 'Product_Id',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'price',
                    LocalDataProperty : unitPrice,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'discount',
                    LocalDataProperty : discount,
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'stock',
                },
            ],
            Label : 'Select Product',
        },
        Common.ValueListWithFixedValues : false,
    );
    quantity @Common.Label : 'Quantity';
    discount @Common.Label : 'Discount';
    totalPrice @Common.Label : 'TotalPrice';
    unitPrice @Common.Label : 'UnitPrice';
}
