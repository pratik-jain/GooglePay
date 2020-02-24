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
    [Table("Rewards",Schema="dbo")]
    public partial class Reward
    {
		#region RewardId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion RewardId Annotations

        public long RewardId { get; set; }

		#region UserId Annotations

        [Required]
        [RelationshipTableAttribue("GpayUsers","dbo","","UserId")]
		#endregion UserId Annotations

        public long UserId { get; set; }


        public Nullable<double> Amount { get; set; }

		#region ScratchStatus Annotations

        [Required]
		#endregion ScratchStatus Annotations

        public bool ScratchStatus { get; set; }

		#region GpayUser Annotations

        [ForeignKey(nameof(UserId))]
        [InverseProperty(nameof(GooglePayApp.Models.Main.GpayUser.Rewards))]
		#endregion GpayUser Annotations

        public virtual GpayUser GpayUser { get; set; }


        public Reward()
        {
        }
	}
}