﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinanzKontrollen.Presentation.WebApi.Model
{
    public class AcknowledgeModel
    {
        public int ProcessedId { get; set; }
        public string Message { get; set; }
    }
}