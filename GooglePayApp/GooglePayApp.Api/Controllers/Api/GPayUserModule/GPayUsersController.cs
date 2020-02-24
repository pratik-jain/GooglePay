using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayApp.UnitOfWork.Main;
using GooglePayApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;
using GooglePayApp.Infrastructure.Security;
using GooglePayApp.Models.ViewModels;
using RxWeb.Core.Security.Cryptography;
using System;
using System.Threading.Tasks;
using RxWeb.Core.Security.Filters;

namespace GooglePayApp.Api.Controllers.GPayUserModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class GPayUsersController : ControllerBase

    {
      

    }
}
