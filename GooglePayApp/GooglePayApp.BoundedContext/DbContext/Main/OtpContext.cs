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
    public class OtpContext : BaseBoundedContext, IOtpContext
    {
        public OtpContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
            public DbSet<OTP>OTPs { get; set; }
            #endregion DbSets

    }


    public interface IOtpContext : IDbContext
    {
    }
}

