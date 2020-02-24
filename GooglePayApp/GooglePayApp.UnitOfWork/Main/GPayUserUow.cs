using RxWeb.Core.Data;
using GooglePayApp.BoundedContext.Main;

namespace GooglePayApp.UnitOfWork.Main
{
    public class GPayUserUow : BaseUow, IGPayUserUow
    {
        public GPayUserUow(IGPayUserContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IGPayUserUow : ICoreUnitOfWork { }
}


