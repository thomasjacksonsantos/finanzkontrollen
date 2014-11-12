﻿using FinanzKontrollen.Presentation.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FinanzKontrollen.Presentation.WebApi.Controllers
{
    public class AccountController : ApiController
    {
        // GET api/values
        public IEnumerable<AccountModel> Get()
        {
            return new AccountModel[] { new AccountModel() { Id = 1, Name = "Account1", Balance = 1900.99M } };
        }

        // GET api/values/5
        public AccountModel Get(int id)
        {
            return new AccountModel() { Id = 1, Name = "Account1", Balance = 1900.99M };
        }

        // POST api/values
        public void Post([FromBody]AccountModel accounts)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]AccountModel accounts)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
