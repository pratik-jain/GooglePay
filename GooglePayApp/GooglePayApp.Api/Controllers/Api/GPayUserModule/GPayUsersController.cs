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
	
	public class GPayUsersController : BaseDomainController<GpayUser,GpayUser>

    {
        public GPayUsersController(IGPayUserDomain domain):base(domain) {}

    }
}
