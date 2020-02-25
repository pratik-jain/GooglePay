using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayApp.UnitOfWork.Main;
using GooglePayApp.Models.Main;
using RxWeb.Core.Data;
using System.Collections.Generic;
using GooglePayApp.BoundedContext.SqlContext;
using GooglePayApp.BoundedContext.Main;

namespace GooglePayApp.Domain.GPayLoginModule
{
    public class GPayLoginDomain : IGPayLoginDomain
    {
        public GPayLoginDomain(IGPayUserUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(GpayUser parameters)
        {
            var login = await Uow.Repository<GpayUser>().SingleOrDefaultAsync(t => t.MobileNumber == parameters.MobileNumber && t.Password == parameters.Password);
            if (login != null)
            {
                return await Task.FromResult("Success");
            }
            else
            {
                return await Task.FromResult("Failed");
            }
            //throw new NotImplementedException();
        }

        public Task<object> GetBy(GpayUser parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(GpayUser entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(GpayUser entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();

            
        }

        public HashSet<string> UpdateValidation(GpayUser entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(GpayUser entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(GpayUser parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(GpayUser parameters)
        {
            throw new NotImplementedException();
        }

        public IGPayUserUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }

    }

    public interface IGPayLoginDomain : ICoreDomain<GpayUser, GpayUser> { }
}
