using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayApp.UnitOfWork.Main;
using GooglePayApp.Models.Main;

namespace GooglePayApp.Domain.GPayUserModule
{
    public class TransactionDomain : ITransactionDomain
    {
        public TransactionDomain(IGPayUserUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Transaction parameters)
        {
            //throw new NotImplementedException();
            return await Uow.Repository<Transaction>().AllAsync();

        }

        public async Task<object> GetBy(Transaction parameters)
        {
            return await Uow.Repository<Transaction>().FindByAsync(t => t.TransactionId == parameters.TransactionId);
        }
        

        public HashSet<string> AddValidation(Transaction entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Transaction entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Transaction entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Transaction entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Transaction parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Transaction parameters)
        {
            throw new NotImplementedException();
        }

        public IGPayUserUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface ITransactionDomain : ICoreDomain<Transaction, Transaction> { }
}
