using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayApp.UnitOfWork.Main;
using GooglePayApp.Models.Main;

namespace GooglePayApp.Domain.GPayUserModule
{
    public class UserBankDetailDomain : IUserBankDetailDomain
    {
        public UserBankDetailDomain(UserBankDetailUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(UserBankDetail parameters)
        {
            return await Uow.Repository<UserBankDetail>().AllAsync();
        }

        public Task<object> GetBy(UserBankDetail parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(UserBankDetail entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(UserBankDetail entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(UserBankDetail entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(UserBankDetail entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(UserBankDetail parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(UserBankDetail parameters)
        {
            throw new NotImplementedException();
        }

        public UserBankDetailUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IUserBankDetailDomain : ICoreDomain<UserBankDetail, UserBankDetail> { }
}
