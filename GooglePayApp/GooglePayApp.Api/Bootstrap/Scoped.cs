#region Namespace
using Microsoft.Extensions.DependencyInjection;
using GooglePayApp.Infrastructure.Security;
using RxWeb.Core.Data;
using RxWeb.Core.Security;
using RxWeb.Core.Annotations;
using RxWeb.Core;
using GooglePayApp.UnitOfWork.DbEntityAudit;
using GooglePayApp.BoundedContext.Main;
using GooglePayApp.UnitOfWork.Main;
using GooglePayApp.Domain.GPayUserModule;
using GooglePayApp.Domain.GPayLoginModule;
using GooglePayApp.Domain.OtpModule;
            #endregion Namespace






namespace GooglePayApp.Api.Bootstrap
{
    public static class ScopedExtension
    {

        public static void AddScopedService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IRepositoryProvider, RepositoryProvider>();
            serviceCollection.AddScoped<ITokenAuthorizer, TokenAuthorizer>();
            serviceCollection.AddScoped<IModelValidation, ModelValidation>();
            serviceCollection.AddScoped<IAuditLog, AuditLog>();
            serviceCollection.AddScoped<IApplicationTokenProvider, ApplicationTokenProvider>();
            serviceCollection.AddScoped(typeof(IDbContextManager<>), typeof(DbContextManager<>));

            #region ContextService

            serviceCollection.AddScoped<ILoginContext, LoginContext>();
            serviceCollection.AddScoped<ILoginUow, LoginUow>();
                        serviceCollection.AddScoped<IGPayUserContext, GPayUserContext>();
            serviceCollection.AddScoped<IGPayUserUow, GPayUserUow>();
                        serviceCollection.AddScoped<IOtpContext, OtpContext>();
            serviceCollection.AddScoped<IOtpUow, OtpUow>();
            #endregion ContextService





            #region DomainService

            
            serviceCollection.AddScoped<IGPayUserDomain, GPayUserDomain>();
            
            serviceCollection.AddScoped<IGPayLoginDomain, GPayLoginDomain>();
            
            serviceCollection.AddScoped<IOtpDomain, OtpDomain>();
            #endregion DomainService



        }
    }
}




