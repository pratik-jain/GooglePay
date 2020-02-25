using RxWeb.Core.Data;
using GooglePayApp.BoundedContext.Main;

namespace GooglePayApp.UnitOfWork.Main
{
    public class OtpUow : BaseUow, IOtpUow
    {
        public OtpUow(IOtpContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IOtpUow : ICoreUnitOfWork { }
}


