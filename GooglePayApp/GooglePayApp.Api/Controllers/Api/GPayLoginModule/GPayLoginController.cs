using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayApp.Domain.GPayLoginModule;
using GooglePayApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayApp.Api.Controllers.GPayLoginModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class GPayLoginController : BaseDomainController<GpayUser,GpayUser>

    {
        public GPayLoginController(IGPayLoginDomain domain):base(domain) {}

    }
}
