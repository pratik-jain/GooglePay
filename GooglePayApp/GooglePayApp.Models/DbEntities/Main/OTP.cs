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
    [Table("OTPs",Schema="dbo")]
    public partial class OTP
    {
		#region OTPId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion OTPId Annotations

        public long OTPId { get; set; }

		#region OTPNumber Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion OTPNumber Annotations

        public int OTPNumber { get; set; }

		#region UserId Annotations

        [Required]
        [RelationshipTableAttribue("GpayUsers","dbo","","UserId")]
		#endregion UserId Annotations

        public long UserId { get; set; }

		#region GpayUser Annotations

        [ForeignKey(nameof(UserId))]
        [InverseProperty(nameof(GooglePayApp.Models.Main.GpayUser.OTPs))]
		#endregion GpayUser Annotations

        public virtual GpayUser GpayUser { get; set; }


        public OTP()
        {
        }
	}
}