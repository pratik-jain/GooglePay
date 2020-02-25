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

         
            using GooglePayApp.Domain.TrasanctionModule;
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
                        serviceCollection.AddScoped<ITransactionContext, TransactionContext>();
            serviceCollection.AddScoped<ITransactionUow, TransactionUow>();
                        
                        serviceCollection.AddScoped<ITransactionContext, TransactionContext>();
            serviceCollection.AddScoped<ITransactionUow, TransactionUow>();
                     
                        serviceCollection.AddScoped<ILoginContext, LoginContext>();
            serviceCollection.AddScoped<ILoginUow, LoginUow>();
            #endregion ContextService









            #region DomainService

            
            serviceCollection.AddScoped<ITransactionDomain, TransactionDomain>();
            
            serviceCollection.AddScoped<ITransactionDomain, TransactionDomain>();
            
           
            
            serviceCollection.AddScoped<ITransactionDomain, TransactionDomain>();
            #endregion DomainService




        }
    }
}




