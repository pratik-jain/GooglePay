using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayApp.Domain.TrasanctionModule;
using GooglePayApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayApp.Api.Controllers.TrasanctionModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class TransactionsController : BaseDomainController<Transaction,Transaction>

    {
        public TransactionsController(ITransactionDomain domain):base(domain) {}

    }
}
