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
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int OrderId { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public Nullable<int> StatusId { get; set; }
        public Nullable<bool> IS_PAYMENT { get; set; }
        public Nullable<bool> IS_DELIVERY { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public Nullable<decimal> OrderPrice { get; set; }
        public Nullable<decimal> Order_KDV_Price { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Order_Status Order_Status { get; set; }
        public virtual Product Product { get; set; }
    }
}