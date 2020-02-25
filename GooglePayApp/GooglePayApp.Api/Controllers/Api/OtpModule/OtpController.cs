using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayApp.Domain.OtpModule;
using GooglePayApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayApp.Api.Controllers.OtpModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class OtpController : BaseDomainController<OTP,OTP>

    {
        public OtpController(IOtpDomain domain):base(domain) {}

    }
}
