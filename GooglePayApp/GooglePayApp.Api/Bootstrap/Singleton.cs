using Microsoft.Extensions.DependencyInjection;
using GooglePayApp.Infrastructure.Singleton;
using GooglePayApp.BoundedContext.Singleton;
using RxWeb.Core.Data;

namespace GooglePayApp.Api.Bootstrap
{
    public static class Singleton
    {
        public static void AddSingletonService(this IServiceCollection serviceCollection)
        {
            #region Singleton
            serviceCollection.AddSingleton<ITenantDbConnectionInfo, TenantDbConnectionInfo>();
            serviceCollection.AddSingleton(typeof(UserAccessConfigInfo));
            #endregion Singleton
        }

    }
}




