using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayApp.Domain.GPayUserModule;
using GooglePayApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayApp.Api.Controllers.GPayUserModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class TransactionsController : BaseDomainController<Transaction, Transaction>

    {
        public TransactionsController(ITransactionDomain domain):base(domain) {}

    }
}
