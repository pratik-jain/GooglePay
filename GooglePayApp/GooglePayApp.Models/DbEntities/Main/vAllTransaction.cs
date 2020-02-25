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

        public long GPayUserId { get; set; }


        public string MobileNumber { get; set; }


        public string UserName { get; set; }


        public long Expr1 { get; set; }


        public long Expr2 { get; set; }


        public double Amount { get; set; }


        public long ReciverId { get; set; }


        public System.DateTime SendDate { get; set; }


        public byte TransactionStatus { get; set; }


        public long UPIId { get; set; }


        public string Remarks { get; set; }


        public vAllTransaction()
        {
        }
	}
}