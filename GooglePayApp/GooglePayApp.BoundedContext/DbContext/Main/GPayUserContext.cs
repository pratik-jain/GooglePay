using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using GooglePayApp.BoundedContext.SqlContext;
using GooglePayApp.Models.Main;
using GooglePayApp.Models;
using GooglePayApp.BoundedContext.Singleton;
using RxWeb.Core.Data;
using RxWeb.Core.Data.Models;
using RxWeb.Core.Data.BoundedContext;

namespace GooglePayApp.BoundedContext.Main
{
    public class GPayUserContext : BaseBoundedContext, IGPayUserContext
    {
        public GPayUserContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
                public DbSet<GpayUser>GpayUsers { get; set; }
                public DbSet<Transaction> Transactions { get; set; }
                public DbSet<UserBankDetail> UserBankDetails { get; set; }
            #endregion DbSets

    }


    public interface IGPayUserContext : IDbContext
    {
    }
}

