//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entities
{
    using System;
    
    public partial class SelectByActiveCustomersOrders_Result
    {
        public int OrderId { get; set; }
        public string ProductName { get; set; }
        public string CustomerName { get; set; }
        public string StatusName { get; set; }
        public Nullable<bool> IS_PAYMENT { get; set; }
        public Nullable<bool> IS_DELIVERY { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public Nullable<decimal> Order_KDV_Price { get; set; }
    }
}
