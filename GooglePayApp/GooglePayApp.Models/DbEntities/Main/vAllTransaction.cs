using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using GooglePayApp.BoundedContext.SqlContext;
namespace GooglePayApp.Models.Main
{
    [Table("vAllTransactions",Schema="dbo")]
    public partial class vAllTransaction
    {

        public long TransactionId { get; set; }


        public long SenderId { get; set; }


        public long ReciverId { get; set; }


        public double Amount { get; set; }


        public long UpiId { get; set; }


        public string Remarks { get; set; }


        public byte TransactionStatus { get; set; }


        public System.DateTime SendDate { get; set; }


        public string MobileNumber { get; set; }


        public string UserName { get; set; }


        public vAllTransaction()
        {
        }
	}
}