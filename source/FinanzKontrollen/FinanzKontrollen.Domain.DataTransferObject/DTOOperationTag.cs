using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinanzKontrollen.Domain.DataTransferObject
{
    public class DTOOperationTag
    {
        public int Id { get; set; }
        public int TagId { get; set; }
        public int OperationId { get; set; }
    }
}