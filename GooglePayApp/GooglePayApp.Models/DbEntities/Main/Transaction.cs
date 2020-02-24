using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using GooglePayApp.Models.Enums.Main;
using GooglePayApp.BoundedContext.SqlContext;
namespace GooglePayApp.Models.Main
{
    [Table("Transactions",Schema="dbo")]
    public partial class Transaction
    {
		#region TransactionId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion TransactionId Annotations

        public long TransactionId { get; set; }

		#region SenderId Annotations

        [Required]
        [RelationshipTableAttribue("GpayUsers","dbo","","SenderId")]
		#endregion SenderId Annotations

        public long SenderId { get; set; }

		#region ReciverId Annotations

        [Required]
        [RelationshipTableAttribue("GpayUsers","dbo","","ReciverId")]
		#endregion ReciverId Annotations

        public long ReciverId { get; set; }

		#region Amount Annotations

        [Required]
		#endregion Amount Annotations

        public double Amount { get; set; }

		#region SendDate Annotations

        [Required]
		#endregion SendDate Annotations

        public System.DateTime SendDate { get; set; }

		#region TransactionStatus Annotations

        [Required]
        [RelationshipTableAttribue("TransactionStatusObjects","dbo","","TransactionStatus")]
		#endregion TransactionStatus Annotations

        public byte TransactionStatus { get; set; }

		#region UPIId Annotations

        [Required]
        [RelationshipTableAttribue("Upis","dbo","","UPIId")]
		#endregion UPIId Annotations

        public long UPIId { get; set; }

		#region Remarks Annotations

        [Required]
		#endregion Remarks Annotations

        public string Remarks { get; set; }

		#region GpayUser Annotations

        [ForeignKey(nameof(SenderId))]
        [InverseProperty(nameof(GooglePayApp.Models.Main.GpayUser.Transactions))]
		#endregion GpayUser Annotations

        public virtual GpayUser GpayUser { get; set; }

		#region GpayUser1 Annotations

        [ForeignKey(nameof(ReciverId))]
        [InverseProperty(nameof(GooglePayApp.Models.Main.GpayUser.Transactions1))]
		#endregion GpayUser1 Annotations

        public virtual GpayUser GpayUser1 { get; set; }

		#region TransactionStatusObject Annotations

        [ForeignKey(nameof(TransactionStatus))]
        [InverseProperty(nameof(GooglePayApp.Models.Main.TransactionStatusObject.Transactions))]
		#endregion TransactionStatusObject Annotations

        public virtual TransactionStatusObject TransactionStatusObject { get; set; }

		#region Upi Annotations

        [ForeignKey(nameof(UPIId))]
        [InverseProperty(nameof(GooglePayApp.Models.Main.Upi.Transactions))]
		#endregion Upi Annotations

        public virtual Upi Upi { get; set; }


        public Transaction()
        {
        }
	}
}