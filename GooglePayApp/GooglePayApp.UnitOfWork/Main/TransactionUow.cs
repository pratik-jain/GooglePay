using RxWeb.Core.Data;
using GooglePayApp.BoundedContext.Main;

namespace GooglePayApp.UnitOfWork.Main
{
    public class TransactionUow : BaseUow, ITransactionUow
    {
        public TransactionUow(ITransactionContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface ITransactionUow : ICoreUnitOfWork { }
}


