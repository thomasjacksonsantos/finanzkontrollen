using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinanzKontrollen.Domain.DataTransferObject
{
    public class DTOCompoundOperation
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime ReferenceDate { get; set; }
        public DateTime PayDate { get; set; }
        public int Id { get; set; }
        public int OperationId { get; set; }
        public int TypeId { get; set; }
        public double Ammount { get; set; }
    }
}