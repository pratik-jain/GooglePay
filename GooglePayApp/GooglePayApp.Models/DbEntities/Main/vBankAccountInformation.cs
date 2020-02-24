using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using GooglePayApp.BoundedContext.SqlContext;
namespace GooglePayApp.Models.Main
{
    [Table("vBankAccountInformation",Schema="dbo")]
    public partial class vBankAccountInformation
    {

        public long UpiId { get; set; }


        public string UpiName { get; set; }


        public long AccountNumber { get; set; }


        public bool AddedStatus { get; set; }


        public long UserId { get; set; }


        public short BankId { get; set; }


        public string MobileNumber { get; set; }


        public string UserName { get; set; }


        public bool UpiPriority { get; set; }


        public vBankAccountInformation()
        {
        }
	}
}